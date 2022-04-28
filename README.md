
# Github Users API by language

This is an API that returns most popular users by language

Our main features are:
- Signup with authentication token for the API
- Login with authentication token for the API
- Return popular users from github by language


## Built With

- Ruby on Rails
- Webpack
- Git
- VSCode
- Linter Checkers

## Deployment Live Demo

Deployed with Heroku
  - Not available

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

- IDE to edit and run the code (I use Visual Studio Code 🔥).
- [Node.js](https://nodejs.org/en/download/) already downloaded.
- [Rails](https://guides.rubyonrails.org/)

### Install

To get a local copy up and running follow these simple example steps.
- Open terminal
- Clone this project using the command
```
git clone git@github.com:Emmanuelaaron/githubusers-api.git
```
- Select the folder
```
cd githubusers-api
```
- To install all project dependencies run:

```
bundle install
```
With this, you will install all dependencies for rails. 

Now to run the server you need to run the rails server.Type on the terminal:
```
rails s
```


### API usage
Copy the url into Postman, or Thunder, or any other APItesting tool to run any end pointof your preference in the table below with a url prefix of '/api/v2' for each

HTTP Method | Endpoint | Functionality 
------------|----------|---------------
POST | /signup | User is able to signup 
POST | /login | User is able to login 
GET | /api-user-call| Gets most popular users by name

- To signup and login, the body should have the parameters below

```
{
    "username": "username",
    "password": "password"
}
```

- To fetch users by Lang you should use the parameter below
```
{
    "lang": "language"
}
```

## Authors 👤 

👤 **Emmanuel Isabirye**

- Github: [@EmmanuelAaron](https://github.com/Emmanuelaaron)
- Twitter: [@EmmanuelAaron](https://twitter.com/EmmanuelIsabir1)
- Linkedin: [@EmmanuelAaron](https://www.linkedin.com/in/fullstackwebdev-emma/)


## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Emmanuelaaron/githubusers-api/issues).

## Show your support

Give a ⭐️ if you like this project!


## Acknowledgments

- Family's support 🙌
- Anynines team 

## 📝 License

This project is [MIT](./LICENSE) licensed.
