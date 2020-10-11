<%= form_with(model:@user, local: true) do |f| %>
    <%= f.label :name %>
    <%= f.text_field :name, class: 'form-control' %>

    <%= f.label :email %>
    <%= f.email_field :email, class: 'form-control' %>

    <%= f.label :password %>
    <%= f.password_field :password, class: 'form-control' %>

    <%= f.label :password_confirmation %>
    <%= f.password_field :password_confirmation, class: 'form-control' %>
    <%= f.submit yield(:button_text), class:"btn btn-primary" %>

<% end %>
