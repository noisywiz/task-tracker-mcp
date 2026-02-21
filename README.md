# Task Tracker MCP Server

A comprehensive task tracking and management system accessible via the **Model Context Protocol (MCP)**. Features projects, tags, priorities, full-text search, and analytics—all designed to work seamlessly with Claude Code and other MCP-compatible tools.

## Features

- **Task Management**: Create, update, delete, and track tasks with priorities and due dates
- **Projects**: Organize tasks into projects
- **Tags**: Categorize and filter tasks with custom tags
- **Full-Text Search**: Search across task titles and descriptions
- **Analytics**: View completion rates, overdue tasks, and productivity metrics
- **SQLite Backend**: Local data storage with FTS5 full-text search
- **Configurable Port**: Run on any available port
- **Docker Support**: Easy containerization and deployment

### Database

- **Location**: `tasks.db` (created automatically in current directory)
- **Type**: SQLite with FTS5 full-text search
- **Schema**: Includes tables for tasks, projects, tags, and relationships

## MCP Server Tools

The server exposes 35+ tools for task management:

### Task Operations
- `create_task` - Create new task
- `get_task` - Get task by ID
- `list_tasks` - List all tasks with pagination
- `update_task` - Update task properties
- `delete_task` - Delete task
- `search_tasks` - Full-text search
- `filter_tasks` - Filter by status, priority, project, or tag

### Project Operations
- `create_project` - Create project
- `get_project` - Get project details
- `list_projects` - List all projects
- `update_project` - Update project
- `delete_project` - Delete project
- `get_project_tasks` - Get tasks for a project

### Tag Management
- `add_tag` - Add tag to task
- `remove_tag` - Remove tag from task
- `list_tags` - List all tags

### Analytics
- `task_statistics` - Get task statistics
- `get_overdue_tasks` - Get overdue tasks

### Resources
- `task://all` - All tasks
- `task://pending` - Pending tasks
- `task://high-priority` - High-priority tasks
- `project://all` - All projects
- `stats://summary` - Statistics summary

### Prompts (Workflows)
- `daily-review` - Daily task review workflow
- `weekly-planning` - Weekly planning workflow
- `project-summary` - Project summary (with project_id parameter)
- `overdue-analysis` - Overdue tasks analysis

## Local Python Installation

If you prefer to run locally without Docker:

```json
{
  "mcpServers": {
    "task-tracker": {
      "command": "python",
      "args": ["-m", "src"]
    }
  }
}
```

## Local Development
```bash
python -m src
```
