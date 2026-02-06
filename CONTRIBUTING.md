# Contributing to Enterprise Plugins Marketplace

This guide explains how to publish plugins to the `enterprise-plugins` marketplace.

## Marketplace Structure

```
enterprise-plugins/
├── .claude-plugin/
│   ├── marketplace.json    # Registry of all plugins
│   └── plugin.json         # Marketplace-level metadata
├── enterprise-team/        # Plugin folder
│   ├── .claude-plugin/
│   │   └── plugin.json     # Plugin configuration
│   ├── agents/             # Agent definitions
│   └── skills/             # Skill definitions
└── README.md
```

## Publishing a New Plugin

### Step 1: Create Your Plugin Folder

```bash
mkdir -p your-plugin-name/.claude-plugin
mkdir -p your-plugin-name/agents
mkdir -p your-plugin-name/skills
```

### Step 2: Create Plugin Configuration

Create `your-plugin-name/.claude-plugin/plugin.json`:

```json
{
  "name": "your-plugin-name",
  "displayName": "Your Plugin Display Name",
  "version": "1.0.0",
  "description": "What your plugin does",
  "author": "Your Name",
  "license": "MIT",
  "homepage": "https://github.com/yourname/your-plugin",
  "agents": ["agent-name-1", "agent-name-2"],
  "skills": ["skill-name-1", "skill-name-2"],
  "config": {
    "auto-activate": true,
    "passive": true
  }
}
```

### Step 3: Register in Marketplace

Add your plugin to `.claude-plugin/marketplace.json`:

```json
{
  "name": "enterprise-plugins",
  "plugins": [
    {
      "name": "your-plugin-name",
      "source": "./your-plugin-name",
      "description": "Your plugin description",
      "version": "1.0.0"
    }
  ]
}
```

### Step 4: Submit PR

1. Fork the repository
2. Add your plugin folder and update marketplace.json
3. Submit a pull request

## Troubleshooting

### "Plugin install returns no output"

**Cause**: A folder or symlink with the same name already exists in `~/.claude/plugins/`

**Check**:
```bash
ls -la ~/.claude/plugins/your-plugin-name
```

**Fix**: Remove the existing folder/symlink first:
```bash
rm -rf ~/.claude/plugins/your-plugin-name   # Remove folder
rm ~/.claude/plugins/your-plugin-name       # Remove symlink
```

Then retry:
```bash
/plugin install your-plugin-name@enterprise-plugins
```

### "Marketplace not found"

**Cause**: Marketplace hasn't been added yet.

**Fix**:
```bash
/plugin marketplace add Chipagosfinest/enterprise-team
```

### Local Development vs Marketplace Install

| Method | Location | Use Case |
|--------|----------|----------|
| **Symlink** | `~/.claude/plugins/name -> /path/to/dev` | Active development |
| **Marketplace Install** | `~/.claude/plugins/cache/...` | Production use |

If you're developing locally, use symlinks. For users, use marketplace install.

**Create development symlink**:
```bash
ln -s /path/to/your/plugin ~/.claude/plugins/your-plugin-name
```

## Plugin Types

### Agent Plugins
Define specialized AI personas in `agents/` folder. Each `.md` file is an agent.

### Skill Plugins
Define reusable skills in `skills/` folder. Each `.md` file is a skill.

### MCP Plugins
Can include MCP server configurations for external tools.

### LSP Plugins
Can configure language server protocol servers.

## Versioning

Use semantic versioning:
- **MAJOR**: Breaking changes
- **MINOR**: New features, backward compatible
- **PATCH**: Bug fixes

Update version in both:
- `your-plugin/.claude-plugin/plugin.json`
- `.claude-plugin/marketplace.json`

## Questions?

Open an issue at https://github.com/Chipagosfinest/enterprise-team/issues
