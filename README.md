# README

# Pre
Ruby ( Rbenv I used)

PostgreSQL

`brew install libsodium`

`brew install postgis`

# Setup
1. Clone repo
2. `bundle install`
3. `bundle exec rake db:create`
4. `bundle exec rake db:migrate`
5. `bundle exec rake db:seed`
6. `rails s`

# 🚀 Deployment  
🔗 [https://nineproject.onrender.com](https://nineproject.onrender.com)  

---

# 🎯 Objective  
Develop a comprehensive App interface and API with the following specifications:  

---

# 💻 Technology Stack  
| Component               | Technology Choice                  |
|-------------------------|------------------------------------|
| Framework               | Rails 7.x with Ruby 3.1           |
| Database                | PostgreSQL                         |
| API Format              | JSON / JSON API                    |
| Testing                 | RSpec                              |
| Data Integrity          | DB constraints & foreign keys      |

---

# ✅ Functional Requirements Checklist  

## 🔐 User Authentication  
- [ ] Implement user registration with email credentials  
- [ ] Implement login functionality  
- [ ] Create seed mechanism for default accounts  

## 🏷️ Brand Management  
- [ ] Enable adding new brands  
- [ ] Allow up to 5 custom fields per brand  
- [ ] Implement brand CRUD operations  

## 📦 Product Management  
- [ ] Enable adding products to brands  
- [ ] Allow up to 5 custom fields per product  
- [ ] Implement price field (required) with currency support  
- [ ] Implement product CRUD operations  

## 🚦 State Management  
- [ ] Add "active/inactive" states for brands  
- [ ] Add "active/inactive" states for products  
- [ ] Implement state change functionality  

## 👥 Client Management  
- [ ] Enable adding new clients  
- [ ] Implement client authentication credentials  
- [ ] Configure client payout rates  

## 🔒 Product Access Control  
- [ ] Allow clients to specify accessible products  
- [ ] Implement access control logic  

## 💳 Card Issuance  
- [ ] Enable card request functionality  
- [ ] Generate unique activation numbers  
- [ ] Implement optional purchase PIN system  

## ❌ Card Cancellation  
- [ ] Allow card cancellation by clients  
- [ ] Implement cancellation tracking  

## 📊 Reporting  
- [ ] Generate spending reports  
- [ ] Generate card cancellation reports  
- [ ] Implement report export functionality  

---

# 🔧 Technical Requirements  

1. **API Development**  
   - [ ] Build RESTful API endpoints  
   - [ ] Implement JSON API standard  

2. **Authentication System**  
   - [ ] Secure all sensitive endpoints  
   - [ ] Implement token-based auth  

3. **Version Control**  
   - [ ] Maintain GitHub repository  
   - [ ] Implement branching strategy  
