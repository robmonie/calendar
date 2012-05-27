## To Do
### Round 1
 * List appointments for practitioner
 * Create appointment for practitioner (select client from drop down)
 * Cancel appointment for practitioner (and probably client as well)
 * Email confirmation for client and practitioner on booking

### To get into prod for Rose

 * Manually seed db with appointment times
 * Populate with client data and existing appointments
 * Heroku ping
 * Integrate with website

### Round 2
 * Reminder emails
 * Remove remaining google stuff














Dev user for testing in a browser - dragonflycalendar1@gmail.com
/businesses/11/book

## To Do:
* Submit booking
* Confirmation email
* Calendar events added to calendar should also send invitation to the client
* Add a cancellation policy
* Extract a Practitioner model and move stuff from user

* Should practitioners just login with their google account ?


## Design decisions:

* All user experiences should be responsive down to iphone size
* It's all about clients booking directly into a google calendar. No other features matter yet.


## Why and who ?

* Assumption that many practitioners use google calendar or just their phone as a way to organise their appointments. The iphone calendar app works so why rewrite it ?
* Assumption that it would be beneficial for practitioners to let their clients book online from their own website.


## Marketing Site

* With Calendar App, your clients can book directly into your Google Calendar from your website or ours.
* Let your clients choose a time that suits them that from a selection of times that are actually available.
* Clients are automatically notified via email when they book and are sent a calendar invitation. They are also reminded once on the day before their appointment.

* You continue to manage your appointments via your Google Calendar, your smart phone, or desktop calendar application.

### Privacy info

#### What we store
* A token, unique to us that grants us access to your calendar via the oAuth2 protocol. This token can only be used in conjunction with our google api key.
* Your client details. This is so that we can send them reminders for appointments. ?? Do we even need to store this ?

#### What we don't store
* We don't store any of your calendar event data. This is all stored in google calendar and accessed when we need to check for availability or book appointments into your calendar. It is possible that future features will require us to store some of this data. If this happens we will update this page with the details.

#### FAQs

* Q. I've added all day events but they aren't the available time slots for the day. A. Make sure you select 'busy' in the calendar event as this is not the default for all day events in Google Calendar.

## Potential Names

* appointly.com (seems to be taken kinda - although domain appears to be available. Also, a product called Appointy exists)
* instabookr.com