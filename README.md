<div align="center">

# ⚡ WEALTHPULSE PRO (v2.4.0-SaaS)
### *Institutional-Grade Multi-Currency Liquidity Engine & Wealth OS*

[![Ruby on Rails](https://img.shields.io/badge/Ruby_on_Rails-7.0.10-cc0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white)](https://rubyonrails.org/)
[![Tailwind CSS](https://img.shields.io/badge/Tailwind_CSS-v3.4-38bdf8?style=for-the-badge&logo=tailwind-css&logoColor=white)](https://tailwindcss.com/)
[![SQLite](https://img.shields.io/badge/SQLite3-Database-003b57?style=for-the-badge&logo=sqlite&logoColor=white)](https://www.sqlite.org/)
[![Puma Server](https://img.shields.io/badge/Puma-v5.6-22c55e?style=for-the-badge&logo=puma&logoColor=white)](https://puma.io/)
[![License: MIT](https://img.shields.io/badge/License-MIT-amber.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

</div>

---

## 📌 Executive Summary

**WealthPulse Pro** is an enterprise-level financial tech SaaS platform built on **Ruby on Rails 7**, **Tailwind CSS**, and **SQLite3**. Designed for high-net-worth individuals, active traders, and startup founders, it bridges high-converting public marketing assets with a strictly isolated, multi-tenant private workspace.

It includes automated multi-currency portfolio tracking, real-time expense velocity modeling, granular budget limits, instant CSV financial statement exports, and proprietary **Panic Blur™** visual security layers.

---

## 🏗️ System Architecture

WealthPulse Pro utilizes dynamic root routing and session-level data scoping to separate public marketing pages from authenticated private dashboards.

```text
                                 +------------------------+
                                 |   Incoming Web Request |
                                 +-----------+------------+
                                             |
                                    [ Action Dispatcher ]
                                             |
                          +------------------+------------------+
                          |                                     |
                [ Guest (Unauthenticated) ]           [ Authenticated User ]
                          |                                     |
               (GET / -> pages#landing)               (GET / -> pages#dashboard)
                          |                                     |
               +----------v----------+               +----------v----------+
               | Marketing Landing   |               | Isolated Workspace  |
               |  - Pricing Tiers    |               |  - Net Worth Sync   |
               |  - Institutional UI |               |  - Panic Blur™ Layer|
               |  - Conversion CTAs  |               |  - User Vaults      |
               +---------------------+               +---------------------+
```

---

## ✨ Key Features & Capability Matrix

### 🔒 Privacy & Panic Blur™
* **One-Click Concealment**: Instantly applies CSS filter masks to sensitive income figures, wallet balances, and ledger rows across the active viewport.
* **Public Work Optimization**: Keyboard and cursor triggers designed for co-working spaces and screen-sharing sessions.

### 💼 Vault & Portfolio Management
* **Multi-Currency Support**: Real-time balance calculations supporting `USD`, `AED`, `EUR`, and cryptocurrency assets (`ETH`, `BTC`).
* **Instant Capital Allocation**: Dynamic breakdown of liquidity across connected accounts.

### 📈 Expense Velocity & Cash Flow Analytics
* **Category Budgets**: Granular spending limits by category (Food, Tech, Subscriptions, Travel) with automated visual progress indicator bars.
* **Ledger Stream**: Real-time transaction recording (`Income` vs `Expense`) with instant balance re-calculation.

### 👤 Role-Based Multi-User Data Isolation
* **Encrypted Auth**: Built on Rails `has_secure_password` utilizing BCrypt hashing.
* **Strict Session Scoping**: Complete database query boundary ensuring users only see their own wallets, budgets, and statements.

---

## 🗄️ Database Schema

The SQLite schema leverages Active Record relational models:

```text
 +----------------------------------+          +----------------------------------+

 |              users               |          |             wallets              |
 +----------------------------------+          +----------------------------------+

 | id               : integer (PK)  |          | id               : integer (PK)  |
 | name             : string        |          | name             : string        |
 | email            : string        |          | balance          : decimal      |
 | password_digest  : string        |          | currency         : string        |
 | created_at       : datetime      |          | created_at       : datetime      |
 | updated_at       : datetime      |          +----------------------------------+
 +----------------------------------+
                                               +----------------------------------+
 +----------------------------------+          |             budgets              |

 |        transaction_items         |          +----------------------------------+
 +----------------------------------+          | id               : integer (PK)  |

 | id               : integer (PK)  |          | category         : string        |
 | title            : string        |          | limit_amount     : decimal      |
 | amount           : decimal      |          | spent_amount     : decimal      |
 | tx_type          : string        |          | recurrence       : string        |
 | created_at       : datetime      |          +----------------------------------+
 +----------------------------------+
```

---

## 🌐 Route Directory & API Endpoints

| HTTP Method | Path | Controller Action | Description | Access Level |
| --- | --- | --- | --- | --- |
| `GET` | `/` | `pages#landing_or_redirect` | Dynamic root (Landing page or Dashboard redirect) | Public / User |
| `GET` | `/dashboard` | `pages#dashboard` | Main private financial workspace | Authenticated |
| `GET` | `/budgets` | `pages#budgets` | Category budget tracking & limits | Authenticated |
| `GET` | `/profile` | `pages#profile` | User profile & tier settings | Authenticated |
| `GET` | `/login` | `sessions#new` | Sign-in interface | Public |
| `POST` | `/login` | `sessions#create` | Authenticates user session | Public |
| `GET` | `/signup` | `users#new` | Account registration interface | Public |
| `POST` | `/users` | `users#create` | Registers new user record | Public |
| `GET` | `/logout` | `sessions#destroy` | Terminates active session | Authenticated |
| `POST` | `/transactions` | `pages#create_transaction` | Commits ledger entry | Authenticated |
| `DELETE` | `/transactions/:id` | `pages#destroy_transaction` | Removes entry from ledger | Authenticated |
| `POST` | `/wallets` | `pages#create_wallet` | Initializes new currency vault | Authenticated |
| `GET` | `/export_statement` | `pages#export_csv` | Downloads full CSV ledger statement | Authenticated |

---

## ⚡ Quick Start & Installation

```bash
# 1. Clone Repository
git clone https://github.com
cd finance-tracker-app

# 2. Install Dependencies & Setup DB
bundle install
bundle exec rails db:migrate

# 3. Boot Server
bundle exec rails server -b 0.0.0.0 -p 3000
```

---

### 👨‍💻 Developed & Maintained By

**[Arbab Ali](https://github.com)**
