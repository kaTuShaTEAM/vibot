serpent = require('serpent')
serp = require 'serpent'.block
lgi = require ('lgi')
bot=dofile('utils.lua')
json=dofile('json.lua')
JSON = (loadfile  "./libs/dkjson.lua")()
redis = (loadfile "./libs/redis.lua")()
database = Redis.connect('127.0.0.1', 6379)
notify = lgi.require('Notify')
tdcli = dofile('tdcli.lua')
notify.init ("Telegram updates")
—---------------------------------------------------------------------—
local help = [[للكل
للكروبات
للخاص
pv

]]
bot_id = 629433740 — Id bot
sudo_users = { — id sudo
489700567
}
  —---------------------------------------------------------------------------------------------
function dl_cb(keko1,keko2)

end
function is_sudo(msg)
  local var = false
  local lgostp = database:get("lgost:sudo"..bot_id..msg.sender_user_id_)
if lgostp then 
  var = true
end
  for k,v in pairs(sudo_users) do
  if msg.sender_user_id_ == v then
  var = true
  end
  end
  return var
end
local function getParseMode(parse_mode)
  if parse_mode then
local mode = parse_mode:lower()

if mode == 'markdown' or mode == 'md' then
P = {ID = "TextParseModeMarkdown"}
elseif mode == 'html' then
P = {ID = "TextParseModeHTML"}
end
  end
  return P
end
function sendContact(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, phone_number, first_name, last_name, user_id)
  tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = from_background,
reply_markup_ = reply_markup,
input_message_content_ = {
ID = "InputMessageContact",
contact_ = {
  ID = "Contact",
  phone_number_ = phone_number,
  first_name_ = first_name,
  last_name_ = last_name,
  user_id_ = user_id
},
},
  }, dl_cb, nil)
end
local function send(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode,dl_cb)
  local TextParseMode = getParseMode(parse_mode)
  tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID = "InputMessageText",
text_ = text,
disable_web_page_preview_ = disable_web_page_preview,
clear_draft_ = 0,
entities_ = {},
parse_mode_ = TextParseMode,
},
  }, dl_cb, nil)
end
function add_user(chat_id, user_id, dl_cb)
  tdcli_function ({
ID = "AddChatMember",
chat_id_ = chat_id,
user_id_ = user_id,
forward_limit_ = forward_limit or 50
  }, dl_cb, nil)
end
function importChatInviteLink(invite_link)
    tdcli_function ({
      ID = "ImportChatInviteLink",
      invite_link_ = invite_link
    }, dl_cb, nil)
end

function openChat(chat_id, cb)
  tdcli_function ({
    ID = "OpenChat",
    chat_id_ = chat_id
  }, cb, nil)
end
local function getMessage(chat_id, message_id,cb)
    tdcli_function ({
    ID = "GetMessage",
    chat_id_ = chat_id,
    message_id_ = message_id
    }, cb, nil)
end
function tdcli_update_callback(data)
if (data.message_) then
local msg = data.message_
local from = msg.sender_user_id_
if tonumber(from) == tonumber(bot_id) then 
      
end
local gr_lgost = database:smembers("lgost:gr"..bot_id) or 0
for i=1,#gr_lgost do 
function lgostooo(lgost1,lgost2)
end
openChat(gr_lgost[i], lgostooo)    
end 
local text = msg.content_.text_
local from = msg.sender_user_id_
if msg.chat_id_ and tonumber(from) ~= tonumber(msg.chat_id_) then 
if (database:get("keko:is_add"..bot_id) and not is_sudo) then 
if msg.content_.ID == "MessageChatAddMembers" then 
changeChatMemberStatus(msg.chat_id_, bot_id, "Left")
end         
end
database:sadd("lgost:gr"..bot_id,msg.chat_id_)  
end
if msg.chat_id_ and tonumber(from) == tonumber(msg.chat_id_) then 
database:sadd("lgost:user"..bot_id,msg.chat_id_)  
end
if tonumber(from) == tonumber(msg.chat_id_) then 
local lgost = database:get("lgost:text"..bot_id)
if lgost then 
send(msg.chat_id_, msg.id_, 1, lgost, 1, 'md')
end
end
        
if msg.content_.ID == "MessageContact" then 
if redis:get("keko:bot:co"..bot_id) then 
return "keko"

end
if msg.content_ and msg.content_.contact_ then 
local lgost_send = database:get("lgost:addText"..from..bot_id)
if lgost_send and lgost_send == "lgost3" then 
local first = msg.content_.contact_.first_name_ or "___"
local phone = msg.content_.contact_.phone_number_
send(msg.chat_id_, msg.id_, 1, "تم التعين بنجاح", 1, 'md')
database:del("lgost:addText"..bot_id..from)
database:set("lgost:name"..bot_id,first)
database:set("lgost:phone"..bot_id,phone)
return "lgost"
end
local first = msg.content_.contact_.first_name_ or "lgost"
local last = msg.content_.contact_.last_name_ or "BY:@lgost"
local phone = msg.content_.contact_.phone_number_
local id = msg.content_.contact_.user_id_
tdcli_function ({
ID = "ImportContacts",
contacts_ = {[0] = {
phone_number_ = tostring(phone),
first_name_ = tostring(first),
last_name_ = tostring(last),
user_id_ = id
},
},
}, dl_cb, nil)
local lgost = database:get("lgost:textco"..bot_id)
local name = database:get("lgost:name"..bot_id)
local phone = database:get("lgost:phone"..bot_id)
if lgost then 
send(msg.chat_id_, msg.id_, 1, lgost, 1, 'md')
end
end
end
if msg.reply_to_message_id_ ~= 0 and database:get("keko:re_text"..bot_id)  then 
function get_keko(extra, result, success)
if (result.sender_user_id_ and result.content_.contact_) then  
send(msg.chat_id_, msg.id_, 1, database:get("keko:re_text"..bot_id), 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,get_keko)
end
if text and is_sudo(msg) then 

local lgost_send = database:get("lgost:addText"..from..bot_id)
if lgost_send and lgost_send == "lgost" then 
send(msg.chat_id_, msg.id_, 1, "تم حبقلبي : "..text, 1, 'md')
database:del("lgost:addText"..from..bot_id)
database:set("lgost:text"..bot_id, text)
end
if lgost_send and lgost_send == "lgost2" then 
 send(msg.chat_id_, msg.id_, 1, "تم حبقلبي : "..text, 1, 'md')
 database:del("lgost:addText"..from..bot_id)
 database:set("lgost:textco"..bot_id, text)
end

if text == "تفعيل المغادره" then 
database:set("keko:is_add"..bot_id,"keko")
send(msg.chat_id_, msg.id_, 1, "تم تفعيل المغادره", 1, 'html')        
end
if text == "تعطيل المغادره" then 
database:del("keko:is_add"..bot_id)
send(msg.chat_id_, msg.id_, 1, "تم تعطيل المغادره", 1, 'html')        
end      
if database:get("keko:keko_stats"..bot_id) then 
database:del("keko:keko_stats"..bot_id)     
database:set("keko:re_text"..bot_id,text)    
send(msg.chat_id_, msg.id_, 1, "تم حبي", 1, 'html')         
end

if text:match("^للكل (.*)$") then
local lgost_text = {string.match(text, "^(للكل) (.*)$")}
local gr_lgost = database:smembers("lgost:gr"..bot_id) or 0
local user = database:smembers("lgost:user"..bot_id) or 0  
for i=1,#gr_lgost do 
send(gr_lgost[i], 0, 1, lgost_text[2], 1, 'md')    
end 
for i=1,#user do 
send(user[i], 0, 1, lgost_text[2], 1, 'md')    
end        
send(msg.chat_id_, msg.id_, 1,"تم النشر للكل ", 1, 'md')    
end
if text:match("^للكروبات (.*)$") then
local lgost_text = {string.match(text, "^(للكروبات) (.*)$")}
local gr_lgost = database:smembers("lgost:gr"..bot_id) or 0
for i=1,#gr_lgost do 
send(gr_lgost[i], 0, 1, lgost_text[2], 1, 'md')    
end       
send(msg.chat_id_, msg.id_, 1,"تم النشر للكروبات ", 1, 'md')    
end
if text:match("^للخاص (.*)$") then
local lgost_text = {string.match(text, "^(للخاص) (.*)$")}
local gr_lgost = database:smembers("lgost:user"..bot_id) or 0  
for i=1,#gr_lgost do 
send(gr_lgost[i], 0, 1, lgost_text[2], 1, 'md')    
end       
send(msg.chat_id_, msg.id_, 1,"تم النشر للخاص ", 1, 'md')    
end
if text == 'pv' then 
local gr_lgost = database:smembers("lgost:gr"..bot_id) or 0
local user = database:smembers("lgost:user"..bot_id) or 0        
function get_keko(extra, result)
local keko = result.total_count_
send(msg.chat_id_, msg.id_, 1, "الكروبات -> "..#gr_lgost ..'\nالجهات -> '..keko.."\nالاعضاء : "..#user, 1, 'html')
end
tdcli_function({
  ID = "SearchContacts",
  query_ = nil,
  limit_ = 999999999
  }, get_keko, {
  chat_id_ = msg.chat_id_
  })
end
function changeChatMemberStatus(chat_id, user_id, status)
tdcli_function ({
ID = "ChangeChatMemberStatus",
chat_id_ = chat_id,
user_id_ = user_id,
status_ = {
ID = "ChatMemberStatus" .. status
},
}, dl_cb, nil)
end
if text and text == 'تنضيف' then 
local gr_lgost = database:smembers("lgost:gr"..bot_id) or 0        
for i=1,#gr_lgost do 
changeChatMemberStatus(gr_lgost[i], bot_id, "Left")
end 
send(msg.chat_id_, msg.id_, 1, "تم", 1, 'html')
end
 
   
if text == 'الاوامر' then 
send(msg.chat_id_, msg.id_, 1, help, 1, 'md')
end
end —sudo 
     — PY @mmmm4
    if text == 'hi' then 
send(msg.chat_id_, msg.id_, 1, "ok", 1, 'html')

end
end — end bot 
end
