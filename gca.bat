@echo off
:: Create docs/chat-logs directory if it doesn't exist
mkdir docs\chat-logs 2>nul

:: Copy sanitized log files (adjust paths as needed)
copy "C:\Users\gordo\mcp-project\sanitized-logs\*.txt" docs\chat-logs\ >nul 2>nul
copy "C:\Users\gordo\mcp-project\sanitized-logs\*.log" docs\chat-logs\ >nul 2>nul
copy "C:\Users\gordo\mcp-project\sanitized-logs\README.md" docs\chat-logs\ >nul 2>nul

:: Add files to git
git add docs\chat-logs\

:: Commit with a descriptive message
git commit -m "Add sanitized chat logs and log files documenting MCP project development

- Sanitized chat logs and log files from project development process
- Removed personal identifiers
- Preserved technical content
- Added comprehensive README for chat logs"

:: Pause to see any potential errors
pause
