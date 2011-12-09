# $(document).ready() equivalent
$ ->
  console.log("kogo started!")


# window.commands
window.commands = {
  "play": /^\/play .*/
  ,"": /^\/me .*/
}


# window.perform_play(name)
window.perform_play = (message) ->
  console.log message
  sounds = {"gobushido": "hey.mp3", "claps": "cheer.mp3"}
  for sound, file_name of sounds
    play_sound(file_name) if message.trim().match(sound)


# window.perform_me(message)
# window.perform_me = (message) ->


# perform(command, message)
perform = (command, message) ->
  window["perform_" + command](message)


# perform_sound(name)
play_sound = (file_name) ->
  console.log file_name
  $('audio')[0].setAttribute('src', '/sounds/'+file_name)
  $('audio')[0].play();


# does_contain_command(message)
does_contain_command = (message) ->
  for command, pattern of window.commands
    return command if message.match(pattern)
  return false


# messages_callback(messages)
messages_callback = (messages) ->
  if messages.length > 0
    for message in messages
      content = message["content"].trim()
      id = message["id"]
      command = does_contain_command(content)
      perform(command, content.slice(1)) if command and content.split(" ").length > 1

      $("<div class=\"message\">"+ id + ": " + content + " </div>").appendTo(".messages")
    $.data document, 'last_message_id', id


# update_channel()
update_channel = () ->
  console.log "updating..."
  last_message_param = ""
  last_message_param = "?last_message_id="+ $.data(document, 'last_message_id') if $.data(document, 'last_message_id') != undefined
  messages_url = "/channels/" + $.data(document, 'channel_id') + "/messages.json" + last_message_param
  jQuery.get(messages_url, messages_callback)

window.channel_update_interval = setInterval(update_channel, 1500) if $.data(document, 'channel_id') != null
