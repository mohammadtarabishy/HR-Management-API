<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;
use App\Helpers\ApiResponse;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Validation\ValidationException;
use Symfony\Component\HttpKernel\Exception\HttpExceptionInterface;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        channels: __DIR__.'/../routes/channels.php',
        web: __DIR__ . '/../routes/web.php',
        commands: __DIR__ . '/../routes/console.php',
        health: '/up',
        api: __DIR__ . '/../routes/api.php',
    )
    ->withMiddleware(function (Middleware $middleware) {
        $middleware->statefulApi();
        $middleware->api([
            \Laravel\Sanctum\Http\Middleware\EnsureFrontendRequestsAreStateful::class,
            'throttle:api',
            \Illuminate\Routing\Middleware\SubstituteBindings::class,
        ]);
    })
    ->withExceptions(function (Exceptions $exceptions) {
        $exceptions->render(function (Throwable $e, $request) {
            if (!$request->expectsJson()) {
                return null;
            }
            if ($e instanceof ValidationException) {
                return ApiResponse::validation($e->errors());
            }
            if ($e instanceof AuthenticationException) {
                return ApiResponse::unauthorized();
            }
            if ($e instanceof HttpExceptionInterface) {
                return ApiResponse::error(
                    $e->getMessage(),
                    $e->getStatusCode()
                );
            }
            return ApiResponse::serverError(
                app()->isProduction()
                    ? 'Something went wrong'
                    : $e->getMessage()
            );
        });
    })
    ->create();

