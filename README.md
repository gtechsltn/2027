# Project Technology Stack

This project is designed to run on **localhost** or a **single Ubuntu
VPS** with a simple, maintainable architecture.

  Component             Recommendation
  --------------------- -----------------------------------------------
  **Frontend**          Next.js + React + TypeScript
  **Backend**           ASP.NET Core 8.0 Web API (Modular Monolith)
  **ORM**               Entity Framework Core 8 (or Dapper if needed)
  **Realtime**          SignalR
  **Authentication**    JWT Bearer or Cookie Authentication
  **Database**          PostgreSQL
  **Search**            PostgreSQL Full-Text Search
  **Cache**             **In-Memory Cache (`IMemoryCache`)**
  **Background Jobs**   `BackgroundService` / `IHostedService`
  **Reverse Proxy**     Nginx
  **Container**         Docker + Docker Compose
  **Deployment**        Ubuntu VPS
