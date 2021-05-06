import cx_Oracle
import time 
import random
from datetime import date

profile_id = 4 #This is Rodger according to the Fake DB Data


dsn = cx_Oracle.makedsn(
    'csdb2.csc.villanova.edu', 
    '1521', 
    'orcl'
)
conn = cx_Oracle.connect(
    user='mjanny', 
    password='Sp01192624', 
    dsn=dsn
)
c = conn.cursor()
print ('Season #, Episode #, Episode Name, Length in Seconds, Description')
c.execute("select ep.season_number, ep.season_episode_number, m.name as episode_name, m.length_seconds, m.description from tv_episodes ep join tv_shows ts on ep.tv_show_id = ts.tv_show_id join media m on m.media_id = ep.media_id where ts.name = 'Game of Thrones'")
for row in c: print(row)

season_string = input("Which Season do you want to watch?: ")
season = int(season_string)
if season > 2:
    print ("Not a valid Season number")
    exit (1)

episode_string = input("Which Episode do you want to watch?: ")
episode = int(episode_string)
if episode > 10:
    print ("Not a valid Episode number")
    exit (1)

print ("You are now watching!")
todays_date = date.today()
time_watched = 0
response = 1
print ("Press Ctrl-C to Stop Watching: ")
while True:
    try:
        time_watched += 1
        time.sleep(1)
    except KeyboardInterrupt:
        break
print ("You watched for " + str(time_watched) + " seconds")


## Create Insert String
# Create View ID
view_id = random.randint(0, 100000000)

# Get Media ID
get_media_id="select media_id from tv_episodes where season_number = " + str(season) + " and season_episode_number = " + str(episode) + " and tv_show_id = 0"
c.execute(get_media_id)
for row in c: media_id_string = row
media_id_string = str(media_id_string)
media_id_string = media_id_string.replace("('", "")
media_id = media_id_string.replace("',)", "")

# Profile ID to String
profile_id = str(profile_id)

# Create Insert String
insert="INSERT INTO Views VALUES(" + str(view_id) + ", " + profile_id + ",'" + media_id + "', to_date('" + str(todays_date) + "', 'yyyy-mm-dd'),'Philadelphia', " + str(time_watched) + ")"
c.execute(insert)
result = conn.commit()
if result == None:
    print ("View successfully stored in Database")

print ("Thanks for Watching!")
conn.close()
