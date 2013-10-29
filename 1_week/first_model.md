Setting up a model requires an associated table in the database. By convention in Rails, the table name should be the lowercase plural of the model name. Example: "Post" model should have a table in the database called "posts".

Here's how to set up the model:
## Step 1.

Create a migration to create the table with a generator. (Migrations are the only place where we want to use generators.)

Issue this command from the terminal within the project directory:

    (postit-template) $ generate migration create_posts

## Step 2.
Open the migration file in your code editor,

    app/db/migrate/[somelongdatenumber]_create_posts.rb

Use the `"create_table"` method to create the necessary table and columns.

We want: a `url` (string), `title`(string), and `description` (text).

    class CreatePosts < ActiveRecord::Migration
      def change
        create_table :posts do |t|
          t.string :title
          t.string :url
          t.text   :description

          t.timestamps
        end
      end
    end


## Step 3.

From the terminal again, issue this command:

    $ rake db:migrate

**NOTE**
(you may need to do rake db:create first, if you're using mysql or postgres).
If you're getting a rake error, you can try adding "bundle exec" before the rake command, like so;

    $ bundle exec rake db:migrate

## Step 4.
Then take a look at your database schema and see that you have a "posts" table with three columns:

Go to db/schema.rb

    ActiveRecord::Schema.define(version: 20131029121427) do

      create_table "posts", force: true do |t|
        t.string   "title"
        t.string   "url"
        t.text     "description"
        t.datetime "created_at"
        t.datetime "updated_at"
      end

    end

## Step 5.
Create a Post model file: under app/models directory, create a post.rb file put

    _"class Post < ActiveRecord::Base; end"_


## Step 6.
Open rails console, and create your first Post object:

    Post.create(title: "My first post", description: "I sure hop this works!", url: "www.yahoo.com").
_(Write this line inside the rails console)_

Verify by looking at your database that this worked.

      $ rails console
      Loading development environment (Rails 4.0.0)
      irb(main):001:0> Post
      => Post(id: integer, title: string, url: string, description: text, created_at: datetime, updated_at: datetime)
      irb(main):002:0> Post.create(title: "My first post", description: "I sure hop this works!", url: "www.yahoo.com")
         (0.1ms)  begin transaction
        SQL (4.2ms)  INSERT INTO "posts" ("created_at", "description", "title", "updated_at", "url") VALUES (?, ?, ?, ?, ?)  [["created_at", Tue, 29 Oct 2013 12:21:51 UTC +00:00], ["description", "I sure hop this works!"], ["title", "My first post"], ["updated_at", Tue, 29 Oct 2013 12:21:51 UTC +00:00], ["url", "www.yahoo.com"]]
         (1.9ms)  commit transaction
      => #<Post id: 1, title: "My first post", url: "www.yahoo.com", description: "I sure hop this works!", created_at: "2013-10-29 12:21:51", updated_at: "2013-10-29 12:21:51">
      irb(main):003:0> Post.first
        Post Load (0.2ms)  SELECT "posts".* FROM "posts" ORDER BY "posts"."id" ASC LIMIT 1
      => #<Post id: 1, title: "My first post", url: "www.yahoo.com", description: "I sure hop this works!", created_at: "2013-10-29 12:21:51", updated_at: "2013-10-29 12:21:51">
      irb(main):004:0>
