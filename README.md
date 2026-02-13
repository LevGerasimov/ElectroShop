# ElectroShop

ElectroShop is a pet project e-commerce application built with Ruby on Rails using the modern Rails stack. The project was created to demonstrate backend architecture design, database interaction, query optimization, and the separation of client-side and server-side logic in a real-world online store scenario.

The application implements a product catalog with dynamic sorting, category filtering, search functionality, image uploads, and full CRUD operations. Administrative actions are protected through user authentication.

# Project Overview

The application follows the standard Ruby on Rails MVC architecture.

Models are responsible for business logic and database interaction via ActiveRecord. Controllers handle URL parameters, process filtering logic, execute SQL queries, and pass data to views. Views are implemented using ERB templates and reusable partial components.

Category filtering is implemented on the server side. When a user clicks on a category in the sidebar, a category_id parameter is appended to the URL. The controller reads this parameter and performs a filtered SQL query to return only the products belonging to the selected category. The application uses includes(:category) to prevent N+1 query issues and improve performance.

Name-based sorting is implemented on the client side. When the sorting option changes, a JavaScript function is triggered. The product array is sorted, the DOM is rebuilt, and the updated list is rendered without a full page reload.

The search feature retrieves the query parameter from the URL, trims whitespace, and checks for empty input. The system then searches products (up to 20 results) by name and description, and categories (up to 10 results). Result limits are applied to maintain performance and prevent excessive database load.

Image uploads are handled through Active Storage, allowing files to be attached directly to the Product model. Authentication is implemented using Devise, providing registration, login, logout, and access control for protected actions.

# Technology Stack

The project is built using Ruby and Ruby on Rails. It leverages Hotwire and Turbo to improve navigation performance without full page reloads. Devise is used for authentication, and Active Storage manages file uploads. SQLite is used as the development database.

# Installation

To run the project locally:

git clone https://github.com/your-username/electroshop.git
cd electroshop
bundle install
rails db:create db:migrate db:seed
rails s


The application will be available at http://localhost:3000.

# Learning Outcomes

Through this project, I practiced designing an e-commerce architecture, working with ActiveRecord associations, optimizing SQL queries, implementing filtering and search logic, and structuring a scalable Rails application. The project demonstrates an understanding of backend fundamentals, database design, and modern Rails development practices.
