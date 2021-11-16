# Using the API

# Posts

## Seeing all posts
```
curl http://localhost:4000/posts 
```

## Seeing a specific post
```
curl http://localhost:4000/posts/:id
```

## Creating a post
```
curl -X POST -H "Content-Type: application/json" \
    -d '{"post": {"content": "Created with curl", "user_id": "5"} }' \
    http://localhost:4000/posts
```

## Updating a post
```
curl -X PUT -H "Content-Type: application/json" \
    -d '{"post": {"content": "Updated with curl"} }' \
    http://localhost:4000/posts/:id
```

## Deleting a post
```
curl -X DELETE http://localhost:4000/posts/:id
```

# Users

## Creating a user
```
curl -X POST -H "Content-Type: application/json" \
    -d '{"user": {"first_name": "Curl", "last_name": "Request", "email": "curl@example.com", "password": "curl"} }' \
    http://localhost:4000/users
```

## Seeing all users
```
curl http://localhost:4000/users 
```

## Seeing a specific user
```
curl http://localhost:4000/users/:id
```

## Updating a user
```
curl -X PUT -H "Content-Type: application/json" \
    -d '{"user": {"first_name": "Curl", "last_name": "Updated", "email": "curl@example.com", "password": "updated"} }' \
    http://localhost:4000/users/:id
```

## Deleting a user - DELETES ALL POSTS AND COMMENTS
```
curl -X DELETE http://localhost:4000/users/:id
```


# Comments

## Creating a comment
```
curl -X POST -H "Content-Type: application/json" \
    -d '{"comment": {"content": "3rd curl comment", "user_id": "5"} }' \
    http://localhost:4000/posts/:post_id/comments
```

## Updating a comment
```
curl -X PUT -H "Content-Type: application/json" \
    -d '{"comment": {"content": "Updated with curl"} }' \
    http://localhost:4000/comments/:id
```

## Deleting a comment
```
curl -X DELETE http://localhost:4000/comments/:id
```

# Other possible ways of creating posts/comments? - NOT IMPLEMENTED: DON'T TRY THESE
```
curl -X POST -H "Content-Type: application/json" \
    -d '{"comment": {"content": "Another curl comment"}, "user_id": "5" }' \
    http://localhost:4000/posts/:post_id/comments
```
```
curl -X POST -H "Content-Type: application/json" \
    -d '{"comment": {"content": "Another curl comment"}, "user": {"user_id": "5"} }' \
    http://localhost:4000/posts/:post_id/comments
```