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

# ✅ Functional Requirements  

## 🔐 User Authentication  
- [ ] Enable user registration and login using email credentials  
- [ ] Preload default accounts through a seed mechanism  

## 🏷️ Brand Management  
- [ ] Facilitate the addition of brands  
- [ ] Allow defining up to 5 customizable data fields for each brand  

## 📦 Product Management  
- [ ] Provide capability to add, update, and delete products associated with brands  
- [ ] Support up to 5 customizable data fields for each product  
- [ ] Mandate inclusion of a price value for products (various currencies)  

## 🚦 State Management  
- [ ] Allow manipulation of brand states ("active"/"inactive")  
- [ ] Allow manipulation of product states ("active"/"inactive")  

## 👥 Client Management  
- [ ] Enable addition of clients  
- [ ] Allow defining authentication credentials  
- [ ] Allow configuring payout rates  

## 🔒 Product Access Control  
- [ ] Empower clients to specify accessible products for their accounts  

## 💳 Card Issuance and Management  
- [ ] Provide ability to request new cards for products  
- [ ] Upon issuance, provide unique activation number  
- [ ] Provide optional purchase details pin  

## ❌ Card Cancellation  
- [ ] Allow clients to cancel previously issued cards  

## 📊 Reporting  
- [ ] Support generation of spending reports  
- [ ] Support generation of card cancellation reports  

---

# 🔧 Technical Requirements  

1. **API Development**  
   - [ ] Develop robust API using Ruby On Rails framework  

2. **Authentication System**  
   - [ ] Implement secure authentication system  

3. **Version Control**  
   - [ ] Maintain version-controlled repository on GitHub  
