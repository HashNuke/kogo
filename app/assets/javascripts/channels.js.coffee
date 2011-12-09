# $(document).ready() equivalent
$ ->
  console.log("kogo started!")


# perform_sound(name)
play_sound = (file_name) ->
  console.log file_name


# match_sound(name)
match_sound = (name) ->
  sounds = {"gobushido": "hey.wav", "claps": "cheer.wav"}
  for sound, file_name of sounds
    play_sound(file_name) if name.trim().match(sound)


# does_contain_command(message)
does_contain_command = (message) ->
  commands = {
    "play": /^\/play .*/
    ,"me": /^\/me .*/
  }
  for command, pattern of commands
    return true if message.match(pattern)
  return false


# messages_callback(messages)
messages_callback = (messages) ->
  if messages.length > 0
    for message in messages
      content = message["content"].trim().split(" ")
      id = message["id"]
      command = does_contain_command(content)
      if command and content.length > 1
        perform(command, content.slice(1))

      $("<div class=\"message\">"+ id + ": " + content.join(" ") + " </div>").appendTo(".messages")
    $.data document, 'last_message_id', id


# update_channel()
update_channel = () ->
  console.log "updating..."
  last_message_param = ""
  last_message_param = "?last_message_id="+ $.data(document, 'last_message_id') if $.data(document, 'last_message_id') != undefined
  messages_url = "/channels/" + $.data(document, 'channel_id') + "/messages.json" + last_message_param
  jQuery.get(messages_url, messages_callback)

window.channel_update_interval = setInterval(update_channel, 1500) if $.data(document, 'channel_id') != null
