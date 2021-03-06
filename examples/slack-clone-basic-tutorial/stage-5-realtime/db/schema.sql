-- USERS
CREATE TABLE public.users (
  id bigint GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  username text
);
-- CHANNELS
CREATE TABLE public.channels (
  id bigint GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  slug text NOT NULL UNIQUE
);
-- MESSAGES
CREATE TABLE public.messages (
  id bigint GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  message text,
  user_id bigint REFERENCES users NOT NULL,
  channel_id bigint REFERENCES channels NOT NULL
);
-- Create the Replication publication for Supabase
CREATE PUBLICATION supabase_realtime FOR ALL TABLES;
-- SOME DUMMY DATA
INSERT INTO
    public.users (username)
VALUES
    ('jarvis'),
    ('tonystark');
INSERT INTO
    public.channels (slug)
VALUES
    ('public'),
    ('random');
INSERT INTO
    public.messages (message, channel_id, user_id)
VALUES
    ('Hello World 👋', 1, 1),
    ('Goodbye cruel world.', 2, 1);