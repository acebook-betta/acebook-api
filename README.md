# Acebook API
An API for interacting with https://acebook-react.herokuapp.com/
Built with rails using Postgresql and session cookies for authentication.

# Using the API
https://acebook-api.herokuapp.com/

* Users must be logged in to see users and their profiles
* Users must be logged in to create a post, comment, or like
* User can only like a post once
* User can only edit and delete their own posts, likes, and comments

* API expects "Content-Type: application/json" header for requests with a body

# Example response: GET /posts
```json
[
    {
        "id": 7,
        "content": "updated from postman",
        "image_url": null,
        "created_at": "2021-11-17T19:32:17.302Z",
        "updated_at": "2021-11-17T20:07:57.736Z",
        "updated": true,
        "like_count": 0,
        "comment_count": 0,
        "user": {
            "id": 14,
            "first_name": "Post",
            "last_name": "Man"
        },
        "comments": [],
        "likes": []
    },
    {
        "id": 6,
        "content": "Post man post",
        "image_url": null,
        "created_at": "2021-11-17T18:18:48.033Z",
        "updated_at": "2021-11-17T18:18:48.033Z",
        "updated": false,
        "like_count": 1,
        "comment_count": 3,
        "user": {
            "id": 14,
            "first_name": "Post",
            "last_name": "Man"
        },
        "comments": [
            {
                "id": 6,
                "content": "Updated with curl again",
                "created_at": "2021-11-17T19:17:24.015Z",
                "updated_at": "2021-11-17T19:27:24.258Z",
                "updated": true,
                "user": {
                    "id": 14,
                    "first_name": "Post",
                    "last_name": "Man"
                }
            },
            {
                "id": 7,
                "content": "New curl post",
                "created_at": "2021-11-17T19:28:04.781Z",
                "updated_at": "2021-11-17T19:28:04.781Z",
                "updated": false,
                "user": {
                    "id": 14,
                    "first_name": "Post",
                    "last_name": "Man"
                }
            },
            {
                "id": 8,
                "content": "New syntax",
                "created_at": "2021-11-17T19:30:07.807Z",
                "updated_at": "2021-11-17T19:30:07.807Z",
                "updated": false,
                "user": {
                    "id": 14,
                    "first_name": "Post",
                    "last_name": "Man"
                }
            }
        ],
        "likes": [
            {
                "id": 9,
                "created_at": "2021-11-17T19:06:17.056Z",
                "user": {
                    "id": 14,
                    "first_name": "Post",
                    "last_name": "Man"
                }
            }
        ]
    },
    {
        "id": 5,
        "content": "Created with curl",
        "image_url": null,
        "created_at": "2021-11-17T12:22:12.490Z",
        "updated_at": "2021-11-17T12:22:12.490Z",
        "updated": false,
        "like_count": 5,
        "comment_count": 0,
        "user": {
            "id": 1,
            "first_name": "Jane",
            "last_name": "Jones"
        },
        "comments": [],
        "likes": [
            {
                "id": 3,
                "created_at": "2021-11-17T16:28:19.028Z",
                "user": {
                    "id": 5,
                    "first_name": "Curl",
                    "last_name": "Updated"
                }
            },
            {
                "id": 4,
                "created_at": "2021-11-17T16:29:23.697Z",
                "user": {
                    "id": 5,
                    "first_name": "Curl",
                    "last_name": "Updated"
                }
            },
            {
                "id": 5,
                "created_at": "2021-11-17T16:29:44.889Z",
                "user": {
                    "id": 5,
                    "first_name": "Curl",
                    "last_name": "Updated"
                }
            },
            {
                "id": 6,
                "created_at": "2021-11-17T16:30:04.208Z",
                "user": {
                    "id": 5,
                    "first_name": "Curl",
                    "last_name": "Updated"
                }
            },
            {
                "id": 10,
                "created_at": "2021-11-17T19:07:53.558Z",
                "user": {
                    "id": 14,
                    "first_name": "Post",
                    "last_name": "Man"
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
    -d '{"content": "Updated with curl"}' \
    https://acebook-api.herokuapp.com/comments/:id
```

## Deleting a comment
```
curl -X DELETE https://acebook-api.herokuapp.com/comments/:id
```


# Likes

## Creating a like
```
curl -X POST https://acebook-api.herokuapp.com/posts/:post_id/likes
```

## Deleting a like
```
curl -X DELETE https://acebook-api.herokuapp.com/likes/:id
```
