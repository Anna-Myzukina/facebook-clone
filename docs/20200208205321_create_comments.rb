class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
    t.text :content
    t.references :post, foreign_key: true
    t.references :user, foreign_key: true
    
    t.timestamps
    end
    add_index :comments, %w[post_id user_id]
  end 
end


<div class="container">
<div class="row">
<p id="notice"><%= notice %></p>

<div class="col-md-4">

<% @posts.each do |post| %>
<p>Username:<%= post.user.username %></p> 
<p>Email:<%= post.user.email %></p> 
<% end %>

</div>
<div class="col-md-8">
<h1>Posts</h1>
<hr>
<% @posts.each do |post| %>
<div class="card ">
<div class="card-header">
<div class="container">
<div class="row">
<div class="col-md-4">

<p><i class="fa fa-user"></i>Author:<%= post.user.username %></p> 
<strong> <p>Created on:<%= post.created_at %></p> </strong>
</div>
<div class="col-md-8">
<ul class="nav nav-tabs card-header-tabs">
<%= link_to 'view', post %>
<%if post.user == current_user%>
<%= link_to ' edit', edit_post_path(post) %>
<%= link_to 'delete', post, method: :delete, data: { confirm: 'Are you sure?' } %>
<%end%>
</ul>
</div>
</div>
</div>
</div>
<div class="card-body">
<h3 class="card-text"> <%= post.body %></h3> 
</div>
<hr>

<div class="input-group mb-3">
<%= render "comment/form" ,post: post=%> 
<% post.comments.each do |comment| %>
<%= render 'comment/comment', comment: comment,post: post %>
<% end %>
</div>
<div>
<td><%= render partial: "likes", locals: {post: post}%></td> 
<td><i class="fa fa-thumbs-up"></i><%= post.likes.count %> <%= (post.likes.count) == 1 ? 'Like' : 'Likes'%></td><hr>
<span class='comment-count'>Comments: <%= post.comments.count =%> </span>
</div>
</div>
<hr>
</div>
<%end %>
</div>
</div>
</div>
