# Project Architecture

## Overview

This project targets **localhost** or a **single Ubuntu VPS**. The
architecture favors simplicity, maintainability, and a clear upgrade
path over distributed complexity.

## Technology Stack

| Component | Recommendation |
|-----------|----------------|
| **Frontend** | Next.js + React + TypeScript |
| **Backend** | ASP.NET Core 8.0 Web API (Modular Monolith) |
| **ORM** | Entity Framework Core 8 (or Dapper if needed) |
| **Realtime** | SignalR |
| **Authentication** | JWT Bearer or Cookie Authentication |
| **Database** | PostgreSQL |
| **Search** | PostgreSQL Full-Text Search |
| **Cache** | In-Memory Cache (`IMemoryCache`) |
| **Background Jobs** | `BackgroundService` / `IHostedService` |
| **Reverse Proxy** | Nginx |
| **Container** | Docker + Docker Compose |
| **Deployment** | Ubuntu VPS |

## High-Level Architecture

``` text
Browser
    │
    ▼
Next.js (React)
    │
 REST API + SignalR
    │
    ▼
ASP.NET Core 8.0 Web API
 ├── Auth
 ├── Users
 ├── Posts
 ├── Comments
 ├── Notifications
 ├── Admin
 └── Background Services
    │
    ▼
PostgreSQL
```

## Backend Structure

``` text
src/
├── WebApi/
├── Application/
│   ├── Auth/
│   ├── Users/
│   ├── Posts/
│   ├── Comments/
│   ├── Notifications/
│   └── Admin/
├── Domain/
├── Infrastructure/
│   ├── Persistence/
│   ├── Authentication/
│   ├── Caching/
│   └── Services/
└── Shared/
```

## Request Flow

1.  Client sends HTTP request to Nginx.
2.  Nginx forwards the request to ASP.NET Core.
3.  ASP.NET Core authenticates the request.
4.  Business logic executes in the Application layer.
5.  Entity Framework Core accesses PostgreSQL.
6.  Frequently used data may be cached with `IMemoryCache`.
7.  Response is returned to the client.
8.  SignalR is used for real-time updates when required.

## Design Principles

-   Modular Monolith.
-   Keep a single deployable application.
-   Avoid unnecessary infrastructure.
-   Add Redis, Elasticsearch, or message queues only when justified.
-   Optimize for maintainability first, scalability second.

## Scaling Roadmap

### Phase 1

-   Single VPS
-   PostgreSQL
-   IMemoryCache
-   Docker Compose

### Phase 2

-   Add Redis
-   Separate background processing

### Phase 3

-   Multiple application instances
-   Redis-backed SignalR
-   Load balancer

### Phase 4

-   Microservices (only if required)
-   Kubernetes
-   Dedicated search and messaging infrastructure

# Folder Structure
```
docs/
├── README.md                  # Tổng quan dự án
├── architecture.md            # Kiến trúc tổng thể
├── project-structure.md       # Cấu trúc source code
├── coding-guidelines.md       # Coding conventions
├── database.md                # Thiết kế database
├── deployment.md              # Triển khai Ubuntu VPS
├── docker.md                  # Docker & Docker Compose
├── authentication.md          # JWT + Authorization
├── api-design.md              # REST API conventions
├── caching.md                 # IMemoryCache
├── logging-monitoring.md      # Logging & Monitoring
├── background-jobs.md         # HostedService
├── signalr.md                 # Realtime
├── security.md                # Security checklist
├── performance.md             # Performance tuning
├── testing.md                 # Unit/Integration testing
├── ci-cd.md                   # GitHub Actions
├── environment.md             # appsettings & secrets
├── roadmap.md                 # Roadmap phát triển
└── scaling-roadmap.md         # Từ 1 VPS → Kubernetes
```

# References

https://chatgpt.com/c/6a4cc00b-2520-83ec-a8d3-c0dd4ecb8ee6