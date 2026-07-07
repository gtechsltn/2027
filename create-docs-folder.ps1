# Create the docs directory
New-Item -ItemType Directory -Path "docs" -Force | Out-Null

# List of documentation files to create
@(
    "README.md",
    "architecture.md",
    "project-structure.md",
    "coding-guidelines.md",
    "database.md",
    "deployment.md",
    "docker.md",
    "authentication.md",
    "api-design.md",
    "caching.md",
    "logging-monitoring.md",
    "background-jobs.md",
    "signalr.md",
    "security.md",
    "performance.md",
    "testing.md",
    "ci-cd.md",
    "environment.md",
    "roadmap.md",
    "scaling-roadmap.md"
) | ForEach-Object {
    New-Item -ItemType File -Path "docs\$_" -Force | Out-Null
}

Write-Host "Documentation files have been initialized."