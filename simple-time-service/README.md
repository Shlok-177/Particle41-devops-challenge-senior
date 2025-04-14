# 🕒 SimpleTimeService

SimpleTimeService is a minimalist Node.js-based web service that returns the current timestamp and the IP address of the client making the request.

This project is part of the [Particle41 DevOps Team Challenge](https://particle41.com), showcasing DevOps best practices including containerization, minimal dependencies, non-root container execution, and clean documentation.

---

## 📦 Features

- Lightweight Express server
- Returns current UTC timestamp and client IP in JSON
- Runs as a non-root user inside Docker
- IPv6-compatible with proper normalization for IPv4-mapped addresses
- Dockerized and ready for deployment on any container orchestration platform

---

## 🔧 Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [Node.js](https://nodejs.org/) (for local testing)

---

## 🚀 How to Run

### 1. Clone the Repository

```bash
git clone https://github.com/<your-username>/simple-time-service.git
cd simple-time-service
```

### 2. Build the Docker Image

```bash
docker build -t simple-time-service .
```

### 3. Run the Docker Container

```bash
docker run -p 3000:3000 simple-time-service
```

### 4. Test the Service

Visit: [http://localhost:3000](http://localhost:3000)

You should receive a response like this:

```json
{
  "timestamp": "2025-04-14T08:26:17.188Z",
  "ip": "127.0.0.1"
}
```

## 🛠 Tech Stack

- Node.js
- Express.js
- Docker (with best practices like non-root user, minimal image)

---

## 📁 Project Structure

```
simple-time-service/
├── Dockerfile         # Docker configuration
├── index.js           # Application code
├── package.json       # Node dependencies
└── README.md          # This file!
```

---

## 📘 Notes

- The service auto-detects IPv4 and IPv6.
- If behind a proxy/load balancer, ensure you set `X-Forwarded-For` header so the real client IP is captured.
- Feel free to fork and expand this microservice for other DevOps experiments.

---