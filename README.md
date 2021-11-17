# Using the API

https://acebook-api.herokuapp.com/

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
    -d '{"post": {"content": "Created with curl", "user_id": "5"} }' \
    https://acebook-api.herokuapp.com/posts
```

## Updating a post
```
curl -X PUT -H "Content-Type: application/json" \
    -d '{"post": {"content": "Updated with curl"} }' \
    https://acebook-api.herokuapp.com/posts/:id
```

## Deleting a post
```
curl -X DELETE https://acebook-api.herokuapp.com/posts/:id
```

# Users

## Creating a user
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

## Deleting a user - DELETES ALL POSTS AND COMMENTS
```
curl -X DELETE https://acebook-api.herokuapp.com/users/:id
```


# Comments

## Creating a comment
```
curl -X POST -H "Content-Type: application/json" \
    -d '{"comment": {"content": "3rd curl comment", "user_id": "5"} }' \
    https://acebook-api.herokuapp.com/posts/:post_id/comments
```

## Updating a comment
```
curl -X PUT -H "Content-Type: application/json" \
    -d '{"comment": {"content": "Updated with curl"} }' \
    https://acebook-api.herokuapp.com/comments/:id
```

## Deleting a comment
```
curl -X DELETE https://acebook-api.herokuapp.com/comments/:id
```


# Likes

## Creating a like
```
curl -X POST -H "Content-Type: application/json" \
    -d '{"like": {"user_id": "5"} }' \
    https://acebook-api.herokuapp.com/posts/:post_id/likes
```

## Deleting a like
```
curl -X DELETE https://acebook-api.herokuapp.com/likes/:id
```

# Other possible ways of creating posts/comments? - NOT IMPLEMENTED: DON'T TRY THESE
```
curl -X POST -H "Content-Type: application/json" \
    -d '{"comment": {"content": "Another curl comment"}, "user_id": "5" }' \
    https://acebook-api.herokuapp.com/posts/:post_id/comments
```
```
curl -X POST -H "Content-Type: application/json" \
    -d '{"comment": {"content": "Another curl comment"}, "user": {"user_id": "5"} }' \
    https://acebook-api.herokuapp.com/posts/:post_id/comments
```