# Laravel Backend Assignment: HR Management API (Task Assignment)

Laravel Backend Assignment: HR Management API - A fully custom-built project 

---

## 📌 Project Overview

HR Management API is a backend API platform that enables organizations to manage:

- Employee records and positions,
- Employee hierarchy and managerial relationships
- Salary updates with event-driven notifications
- Import/Export of employee data (CSV)
- Logging and tracking of employee changes (DB Logs - File Logs)
- Rate-limited API for secure access
- Full test coverage with TDD approach


**Development Duration:** 2–3 days  
**Project Type:** Custom Laravel API  
**Status:** MVP 

---

## 🛠️ System Architecture & Work Process

### Backend
- Laravel 12
- RESTful API endpoints with versioning (`/api/v1/...`)
- Eloquent ORM for database interactions
- Event-driven architecture for logging changes
- Artisan commands for database export, seeding, and log management
- Rate limiting middleware for API security
- Fully tested using PHPUnit & Laravel test suite

### Database
- MySQL 8+
- Employees table with salary history tracking
- Positions table for role management
- Employee logs for audit trail


### Frontend
- just a small email template

---

## 🚀 Key Features

- Employee CRUD operations
- position CRUD operations
- Employee logs
- Employee Hierarchy and hierarchical salary reports
- CSV import/export
- JSON export
- SQL database export
- Artisan commands:
  - Delete old logs
  - Clear all log files
  - Seed employees with progress bar
  - Export database to SQL
  - Export employees to JSON
- API versioning (`/api/v1/`)
- Rate limiting (10 requests per minute)
- Full test coverage

---

## 🧰 Tech Stack

**Backend**
- Laravel 12
- php 8.5
- MySQL 8+
- RESTful APIs
- Eloquent ORM
- Event Broadcasting
- Queue

---

## 🚀 Installation Guide

1. Clone the repository.
2. composer install.
3. cp .env.example .env
4. php artisan api:install
5. php artisan key:generate
6. php artisan migrate
7. php artisan queue:listen


## ⚡ API Endpoints

All endpoints are versioned under /api/v1/.

## ⚙️ Artisan Commands

- `php artisan employee:logs:cleanup --days=30`           Delete employee logs older than 1 month      
- `php artisan logs:clear-files --force`                  Remove all log files : --force for forced action                     
- `php artisan employee:seed {count}`                     Seed employees with progress bar             
- `php artisan db:export {--path=}`                       Export database to SQL (optional path)       
- `php artisan employees:json {--path=}`                  Export all employees to JSON (optional path) 


## ⚡⚡ Notes

- Check the public\project folder contains( .env - my_db Backup - postman collection - CSV import sample - email sample - ERD Diagram).
- mail confige in .env file required for testing emails i used for that mailtrap.io provider.

