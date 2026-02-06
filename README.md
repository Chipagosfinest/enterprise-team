<p align="center">
  <img src="https://img.shields.io/badge/Claude_Code-Plugin-blueviolet?style=for-the-badge" alt="Claude Code Plugin"/>
  <img src="https://img.shields.io/badge/Agents-75-green?style=for-the-badge" alt="75 Agents"/>
  <img src="https://img.shields.io/badge/Departments-10-blue?style=for-the-badge" alt="10 Departments"/>
  <img src="https://img.shields.io/badge/Model-Opus-purple?style=for-the-badge" alt="Opus Powered"/>
</p>

<h1 align="center">Enterprise Team</h1>

<p align="center">
  <strong>Hire a whole company with one plugin.</strong><br/>
  75 specialized AI agents across Engineering, Product, Infrastructure, Data, Security, Marketing, Sales, Finance, Legal, and People.
</p>

<p align="center">
  <img src="assets/architecture.jpg" alt="Enterprise Team Architecture" width="100%"/>
</p>

---

## The Problem

You have Claude Code. You have skills. But when you say "build me a feature," who decides whether that's a frontend task, backend task, or both? When you say "deploy this," who knows if you need DevOps, database work, or infrastructure setup?

**Skills are powerful but siloed.** You end up calling them manually or hoping the right one triggers.

## The Solution

**Enterprise Team** gives you a virtual company with department orchestrators that route work to the right specialists automatically.

<p align="center">
  <img src="assets/how-it-works-v3.png" alt="How It Works - Before vs After Enterprise Team" width="100%"/>
</p>

---

## Quick Start

```bash
# Install with npx
npx skills add Chipagosfinest/enterprise-team --yes

# Or clone directly
git clone https://github.com/Chipagosfinest/enterprise-team.git ~/.claude/plugins/enterprise-team
```

Then just ask for what you need:

```
"Design and build a settings page with dark mode"
"Set up CI/CD with GitHub Actions"
"Create a financial model for our Q2 projections"
"Review this code for security vulnerabilities"
"Plan our product launch campaign"
```

---

## Departments & Specialists

### Engineering (10 specialists)
| Specialist | Expertise |
|------------|-----------|
| `backend-engineer` | APIs, Node.js, Python, PostgreSQL, REST, GraphQL |
| `frontend-engineer` | React, Vue, TypeScript, CSS, accessibility |
| `fullstack-engineer` | End-to-end development across all layers |
| `mobile-developer` | iOS, Android, React Native, Flutter |
| `embedded-engineer` | Firmware, IoT, C/C++, microcontrollers |
| `blockchain-engineer` | Smart contracts, Solidity, Web3, DeFi |
| `ml-developer` | PyTorch, TensorFlow, ML pipelines |
| `solutions-architect` | System design, architecture decisions |
| `qa-engineer` | Testing, test automation, quality assurance |
| `technical-writer` | Documentation, API docs, tutorials |

### Infrastructure (4 specialists)
| Specialist | Expertise |
|------------|-----------|
| `devops-engineer` | Docker, Kubernetes, Terraform, CI/CD |
| `sre` | Monitoring, incidents, SLOs, reliability |
| `database-engineer` | PostgreSQL, Supabase, migrations |
| `systems-admin` | Linux, Windows Server, cloud admin |

### Product (5 specialists)
| Specialist | Expertise |
|------------|-----------|
| `product-manager` | Roadmaps, prioritization, PRDs |
| `ux-researcher` | User interviews, personas, testing |
| `ui-designer` | Visual design, design systems |
| `design-strategist` | Design systems, experience strategy |
| `instructional-designer` | Learning design, course development |

### Data (3 specialists)
| Specialist | Expertise |
|------------|-----------|
| `data-engineer` | ETL, pipelines, data warehouses |
| `data-analyst` | SQL, dashboards, business intelligence |
| `data-scientist` | ML models, statistical analysis, experiments |

### Security (3 specialists)
| Specialist | Expertise |
|------------|-----------|
| `security-engineer` | Secure coding, vulnerability fixes |
| `security-auditor` | Penetration testing, risk assessment |
| `compliance-officer` | SOC2, GDPR, regulatory compliance |

### Marketing (14 specialists)
| Specialist | Expertise |
|------------|-----------|
| `growth-marketer` | Acquisition, conversion, paid ads |
| `content-marketer` | Blog posts, SEO content, content strategy |
| `product-marketer` | Positioning, launches, competitive analysis |
| `brand-marketer` | Brand strategy, identity, guidelines |
| `social-media-manager` | Social content, community, engagement |
| `seo-specialist` | Search optimization, keywords, technical SEO |
| `email-marketer` | Email campaigns, automation, newsletters |
| `pr-specialist` | Media relations, press releases |
| `communications-specialist` | Internal/external comms, messaging |
| `community-manager` | Community building, forums, advocacy |
| `events-manager` | Conferences, webinars, trade shows |
| `video-producer` | Video content, production, editing |
| `graphic-designer` | Visual design, collateral, graphics |
| `web-designer` | Website design, landing pages |

### Sales (5 specialists)
| Specialist | Expertise |
|------------|-----------|
| `account-executive` | Sales cycles, negotiations, closing |
| `sales-engineer` | Technical sales, demos, POCs |
| `business-developer` | New markets, lead gen, opportunities |
| `partnerships-manager` | Strategic partnerships, alliances |
| `customer-success-manager` | Onboarding, retention, expansion |

### Finance (4 specialists)
| Specialist | Expertise |
|------------|-----------|
| `financial-analyst` | Modeling, forecasting, unit economics |
| `accountant` | General ledger, reconciliations, close |
| `controller` | Financial reporting, compliance |
| `corporate-development` | M&A, strategic investments |

### Legal (4 specialists)
| Specialist | Expertise |
|------------|-----------|
| `legal-counsel` | Contracts, compliance, IP |
| `compliance-officer` | Regulatory, SOC2, GDPR |
| `contract-manager` | CLM, negotiations, vendor management |
| `paralegal` | Document prep, research, support |

### People (6 specialists)
| Specialist | Expertise |
|------------|-----------|
| `recruiter` | Hiring, sourcing, candidate experience |
| `hr-manager` | HR operations, policies, employee relations |
| `compensation-analyst` | Salary, equity, benefits benchmarking |
| `talent-development` | Learning, performance, career growth |
| `hris-analyst` | HR systems, people analytics |
| `payroll-specialist` | Payroll processing, tax compliance |

### Support (4 specialists)
| Specialist | Expertise |
|------------|-----------|
| `it-support` | Helpdesk, systems, endpoint security |
| `support-engineer` | Technical support, issue diagnosis |
| `developer-relations` | Developer community, SDKs, docs |
| `technical-trainer` | Training programs, workshops |

### Consulting (2 specialists)
| Specialist | Expertise |
|------------|-----------|
| `technical-consultant` | Client solutions, implementations |
| `technical-business-analyst` | Requirements, process mapping |

### Program Management (1 specialist)
| Specialist | Expertise |
|------------|-----------|
| `technical-program-manager` | Agile, sprint planning, delivery |

---

## Why This Approach?

| Approach | Pros | Cons |
|----------|------|------|
| **Individual Skills** | Focused, lightweight | Manual invocation required |
| **Single Agent** | Simple | Jack of all trades, master of none |
| **Enterprise Team** | Right specialist for every task | Slightly more setup |

The orchestrator pattern means you get **expert-level responses** without needing to know which expert to call.

---

## License

MIT © [Alec Gutman](https://github.com/Chipagosfinest)
