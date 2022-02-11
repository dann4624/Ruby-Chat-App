# Ruby Chat App
A Chat Application built in Ruby on Rails

## Prerequisites
Rails 7.0.1
Ruby 3.0.3p157
Redis Server 5.0.7

## Administration
In order to create, edit and delete chat rooms, a user has to be an Admin.
In order to make an Admin user:
  In the Rails Console:
    User.create(username:"DesiredUsername",email:"desired@e.mail",password:"DesiredPassword",avatar:"https://desired.website.url/for/image.extension",admin:1)
    
Afterwards, the newly created Admin User can sign in and create chat rooms, modify any existing chat room and delete any exisiting chat rooms.
Admin Users can also edit and delete ANY message.

## Acknowledgements
Creation of of chatrooms are synchronous, while modification and deletions are not (in the sense that any modifications to the chat rooms or deletions will not appear to other users until they refresh the page).
The same is true regarding sending and receiving messages. Sending and receiving messages are synchronous, deletion and modification of messages are not (in the sense that any modifications to messages will not appear to other users until they refresh the page or send a message themselves).
