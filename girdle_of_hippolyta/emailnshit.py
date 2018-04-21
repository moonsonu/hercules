# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    emailnshit.py                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ksonu <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/04/20 16:10:05 by ksonu             #+#    #+#              #
#    Updated: 2018/04/20 20:55:15 by ksonu            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

from email.MIMEMultipart import MIMEMultipart
from email.MIMEText import MIMEText
import getpass
import smtplib

from_email = raw_input('From : ')
from_ePW = getpass.getpass("password: ")
to_email = raw_input('To : ')
subjecttt = 'GIRDLE of HIPPOLYTA!'
bodyyy = "Dear Warriors, \n\n\n King Eurystheus,i\n who is always ready to make his daughter happy,\n and send Heracles away again to die,\n commanded him to bring back the Girdle of Hippolyta...\n\n Heracules was not bothered by the task, he was prepared for anything.\n Well, maybe not to fight a whole army by himself.\n He emailed all of his friends to form an army to fight the Amazons.\n\n He also emailed Hippolyte, explaining the situation, asking for the girdle.\n\n Heracules checked his email. His bros and warriors alike responded quickly.\n He set off toward Queen Hippolyte and her tribe.\n\n Although the piece of armor was special,\n given to her because she was the best warrior among the Amazons,\n she sent a reply to Heracules, saying he could have it.\n\n This made Hera super angry, while she read their emails.\n The army arrived and it was too late.\n Although Hippolyta was ready to hand over the girdle,\n the angry godess Hera had given bad omen to Heracules arrival.\n\n Heracules stabbed Hippolyta and their armies fought!\n Returning to Eurystheus back in Mycenae, Heracules checked his email again.\n Seeing the message from Hippolyta, ignoring it.\n Then a quick reply all to his friends.\n The labour was done.\n\n This was just one of many versions of this labour,\n but in no version does Heracules do anything about killing Hippolyta...\n\n JOIN MY ARMY!\n"
msg = MIMEMultipart()
msg['From'] = from_email
msg['To'] = to_email
msg['Subject'] = subjecttt
part1 = MIMEText(bodyyy, 'plain')
msg.attach(part1)
server = smtplib.SMTP('smtp.gmail.com', 587)
server.starttls()
server.login(from_email, from_ePW)
server.sendmail(from_email, to_email, msg.as_string())
print '\nMAIL SENT SUCCESSFULLY'
server.quit()
