# Blockchain-Based Marketing Customer Loyalty Programs

A comprehensive blockchain-based loyalty program system built with Clarity smart contracts for the Stacks blockchain. This system provides a decentralized, transparent, and secure way to manage customer loyalty programs with advanced analytics and segmentation capabilities.

## 🚀 Features

### Core Components

1. **Marketing Department Verification** (`marketing-verification.clar`)
    - Validates and authorizes marketing departments
    - Manages department credentials and contact information
    - Owner-controlled verification system

2. **Loyalty Points Management** (`loyalty-points.clar`)
    - Mint, burn, and transfer loyalty points
    - Track customer balances and total earnings
    - Authorized minter system for security

3. **Reward Management** (`reward-management.clar`)
    - Create and manage loyalty program rewards
    - Handle reward redemptions with point deduction
    - Track reward availability and status

4. **Customer Segmentation** (`customer-segmentation.clar`)
    - Automatic tier calculation based on total points earned
    - Four-tier system: Bronze, Silver, Gold, Platinum
    - Tier-based benefits and multipliers

5. **Program Analytics** (`program-analytics.clar`)
    - Track daily program statistics
    - Monitor customer activity and engagement
    - Generate comprehensive program insights

## 🏗️ Architecture

\`\`\`
┌─────────────────────────────────────────────────────────────┐
│                    Loyalty Program System                    │
├─────────────────────────────────────────────────────────────┤
│  Marketing Verification  │  Loyalty Points  │  Rewards      │
│  - Verify departments    │  - Mint/Burn     │  - Create     │
│  - Manage credentials    │  - Transfer      │  - Redeem     │
│                         │  - Track balance │  - Manage     │
├─────────────────────────────────────────────────────────────┤
│  Customer Segmentation  │  Program Analytics               │
│  - Tier calculation     │  - Daily stats                   │
│  - Benefits management  │  - Customer insights             │
│  - Auto-updates        │  - Performance tracking          │
└─────────────────────────────────────────────────────────────┘
\`\`\`

## 🎯 Customer Tiers

| Tier | Threshold | Multiplier | Exclusive Rewards |
|------|-----------|------------|-------------------|
| Bronze | 100+ points | 1x | No |
| Silver | 500+ points | 2x | No |
| Gold | 1,000+ points | 3x | Yes |
| Platinum | 2,500+ points | 5x | Yes |

## 🛠️ Installation & Setup

1. **Clone the repository**
   \`\`\`bash
   git clone <repository-url>
   cd blockchain-loyalty-program
   \`\`\`

2. **Install dependencies**
   \`\`\`bash
   npm install
   \`\`\`

3. **Run tests**
   \`\`\`bash
   npm test
   \`\`\`

4. **Deploy contracts**
   \`\`\`bash
   # Deploy to local testnet
   npm run deploy:local

   # Deploy to testnet
   npm run deploy:testnet
   \`\`\`

## 📋 Usage Examples

### 1. Verify Marketing Department
\`\`\`clarity
(contract-call? .marketing-verification verify-department
'SP1HTBVD3JG9C05J7HBJTHGR0GGW7KX17ECNWWALK
"Acme Marketing"
"contact@acme.com")
\`\`\`

### 2. Mint Loyalty Points
\`\`\`clarity
(contract-call? .loyalty-points mint-points
'SP1HTBVD3JG9C05J7HBJTHGR0GGW7KX17ECNWWALK
u100)
\`\`\`

### 3. Create Reward
\`\`\`clarity
(contract-call? .reward-management create-reward
"Free Coffee"
"Complimentary coffee at participating locations"
u50
u100)
\`\`\`

### 4. Redeem Reward
\`\`\`clarity
(contract-call? .reward-management redeem-reward u1)
\`\`\`

### 5. Update Customer Segment
\`\`\`clarity
(contract-call? .customer-segmentation update-customer-segment
'SP1HTBVD3JG9C05J7HBJTHGR0GGW7KX17ECNWWALK)
\`\`\`

## 🔒 Security Features

- **Owner-controlled functions** for critical operations
- **Authorized minter system** for point issuance
- **Balance validation** before point transfers/burns
- **Reward availability checks** before redemption
- **Input validation** for all public functions

## 📊 Analytics & Insights

The system provides comprehensive analytics including:
- Daily program statistics
- Customer activity tracking
- Tier distribution analysis
- Redemption patterns
- Program performance metrics

## 🧪 Testing

The project includes comprehensive tests using Vitest:
- Unit tests for all contract functions
- Integration tests for cross-contract interactions
- Edge case testing for security scenarios

Run tests with:
\`\`\`bash
npm test
\`\`\`

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🆘 Support

For support and questions:
- Create an issue in the repository
- Contact the development team
- Check the documentation wiki

## 🗺️ Roadmap

- [ ] Mobile app integration
- [ ] Multi-brand support
- [ ] Advanced analytics dashboard
- [ ] Social sharing features
- [ ] Gamification elements
- [ ] Cross-chain compatibility
