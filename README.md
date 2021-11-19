# Acebook API - https://acebook-api.herokuapp.com/

An API for interacting with https://acebook-react.herokuapp.com/
Built with rails using Postgresql and session cookies for authentication.

# Using the API

## Requests
* Users must be logged in to see users and their profiles
* Users must be logged in to create a post, comment, or like
* User can only like a post once
* User can only edit and delete their own posts, likes, and comments
* API expects "Content-Type: application/json" header for requests with a body

## Responses
* For actions where you are creating, it returns an object on success
* On fail, it returns the relevant status code and a descriptive error message
* Data is nested appropriately for use in the front end

## Example response: GET /posts

### Posts are sorted newest first
```json
[
    {
        "id": 2,
        "content": "Hello github",
        "image_url": null,
        "created_at": "2021-11-18T20:46:15.119Z",
        "updated_at": "2021-11-18T20:46:15.119Z",
        "updated": false,
        "like_count": 0,
        "comment_count": 0,
        "user": {
            "id": 2,
            "first_name": "Git",
            "last_name": "Hub"
        },
        "comments": [],
        "likes": []
    },
    {
        "id": 1,
        "content": "Hello again",
        "image_url": null,
        "created_at": "2021-11-18T20:20:23.446Z",
        "updated_at": "2021-11-18T20:20:23.446Z",
        "updated": false,
        "like_count": 2,
        "comment_count": 1,
        "user": {
            "id": 1,
            "first_name": "New",
            "last_name": "User"
        },
        "comments": [
            {
                "id": 1,
                "content": "updated",
                "created_at": "2021-11-18T20:31:26.358Z",
                "updated_at": "2021-11-18T20:32:40.108Z",
                "updated": true,
                "like_count": 1,
                "user": {
                    "id": 1,
                    "first_name": "New",
                    "last_name": "User"
                },
                "likes": [
                    {
                        "id": 2,
                        "created_at": "2021-11-18T20:35:04.854Z",
                        "user": {
                            "id": 1,
                            "first_name": "New",
                            "last_name": "User"
                        }
                    }
                ]
            }
        ],
        "likes": [
            {
                "id": 1,
                "created_at": "2021-11-18T20:28:19.514Z",
                "user": {
                    "id": 1,
                    "first_name": "New",
                    "last_name": "User"
                }
            },
            {
                "id": 3,
                "created_at": "2021-11-18T21:05:39.650Z",
                "user": {
                    "id": 2,
                    "first_name": "Git",
                    "last_name": "Hub"
                }
            }
        ]
    }
]
```

# :warning: If using fetch make sure to include the following line:
```
fetch('https://acebook-api.herokuapp.com' {
   credentials: 'include' 
})
```
## This enables your client to store and send the cookie from the server so that you can be authenticated on subsequent requests.

# Users

## Creating a user (registering)
```
curl -X POST -H "Content-Type: application/json" \
    -d '{"user": {"first_name": "Curl", "last_name": "Request", "email": "curl@example.com", "password": "curl"} }' \
    https://acebook-api.herokuapp.com/users
```

## Seeing all users
```
curl https://acebook-api.herokuapp.com/users 
```

## Seeing a specific user
```
curl https://acebook-api.herokuapp.com/users/:id
```

## Updating a user
```
curl -X PUT -H "Content-Type: application/json" \
    -d '{"user": {"first_name": "Curl", "last_name": "Updated", "email": "curl@example.com", "password": "updated"} }' \
    https://acebook-api.herokuapp.com/users/:id
```

## Deleting a user - Deletes all posts, comments, and likes by that user
```
curl -X DELETE https://acebook-api.herokuapp.com/users/:id
```

# Sessions

## Logging in
```
curl -X POST -H "Content-Type: application/json" \
    -d '{"session": {"email": "abc123@example.com", "password": "abc123"} }' \
    https://acebook-api.herokuapp.com/login
```

## Logging out
```
curl -X DELETE https://acebook-api.herokuapp.com/logout
```

## Seeing if a user is logged in
```
curl https://acebook-api.herokuapp.com/logged_in
```

# Posts

## Seeing all posts
```
curl https://acebook-api.herokuapp.com/posts 
```

## Seeing a specific post
```
curl https://acebook-api.herokuapp.com/posts/:id
```

## Creating a post
```
curl -X POST -H "Content-Type: application/json" \
    -d '{ "post": {"content": "New post syntax"} }' \
    https://acebook-api.herokuapp.com/posts
```

## Updating a post
```
curl -X PUT -H "Content-Type: application/json" \
    -d '{"post": {"content": "Updated with curl"} }' \
    https://acebook-api.herokuapp.com/posts/:id
```

## Deleting a post - Delets all comments and likes for that post
```
curl -X DELETE https://acebook-api.herokuapp.com/posts/:id
```

# Comments

## Creating a comment
```
curl -X POST -H "Content-Type: application/json" \
    -d '{"comment": {"content": "3rd curl comment"} }' \
    https://acebook-api.herokuapp.com/posts/:post_id/comments
```

## Updating a comment
```
curl -X PUT -H "Content-Type: application/json" \
    -d '{ "comment": {"content": "Updated with curl"} }' \
    https://acebook-api.herokuapp.com/comments/:id
```

## Deleting a comment - Deletes all likes for that comment
```
curl -X DELETE https://acebook-api.herokuapp.com/comments/:id
```


# Likes

## Liking a post
```
curl -X POST https://acebook-api.herokuapp.com/posts/:post_id/likes
```

## Liking a comment
```
curl -X POST https://acebook-api.herokuapp.com/comments/:comment_id/likes
```

## Deleting a like
```
curl -X DELETE https://acebook-api.herokuapp.com/likes/:id
```

# Using an external host
Instructions for hosting on heroku
- Install heroku on your computer. For a mac: $ brew tap heroku/brew && brew install heroku
- Create a heroku account: $ heroku login. Then follow the instructions for creating an account/logging in
- From your project directory, you can push your code manually to heroku: $ git push heroku HEAD:main. Open the url in your browser from your terminal: $ heroku login
- Or, login to the heroku website and connect your heroku account to your github repo via the 'Deploy' tab. 

