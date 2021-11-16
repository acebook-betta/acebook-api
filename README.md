# Using the API

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

## Seeing all posts
```
curl http://localhost:4000/posts 
```