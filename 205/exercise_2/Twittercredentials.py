import tweepy

consumer_key = "Qhu00hh4OvARiP3FbHn5mIlqB";
#eg: consumer_key = "YisfFjiodKtojtUvW4MSEcPm";


consumer_secret = "2W6XwbQBbi3bWBOgpnWsvmt5xVnRybvaf36SgVGtbI4EXqOghL";
#eg: consumer_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token = "2815190526-zfFsdXhMA3vPRSUkjDtyARqldORvO2MkGr1Brkf";
#eg: access_token = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token_secret = "SQxfIfCgR8d6LeI2NjeqpvoexHeyAFLcQYtPUmlfstftr";
#eg: access_token_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";


auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.API(auth)



