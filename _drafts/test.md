---
date: '2019-04-26 19:53:56 +0200'
layout: post
sub_heading: A sub heading here
tags: []
banner_image: ''
related_posts: []
gallery: []
authors:
- name: Tom
  bio: Random guy
  photo: "/uploads/2017/11/14/andrew-robles-300868.jpg"
  url: https://example.com
title: ''
description: ''
image: "/2019/05/11/empty-state-media.png"
pages: ''
people: ''

---
\### Deploying to Google Play Store

If you add **Google Play Deploy** step to your workflow (after the **Android Sign** Step), your signed APK will get uploaded to Google Play Store.

Before you'd use the **Google Play Deploy** Step, make sure you have performed the following tasks:

1\. Upload the first APK manually to Google Play \[using the Google Play Console\]([https://support.google.com/googleplay/android-developer/answer/113469?hl=en](https://support.google.com/googleplay/android-developer/answer/113469?hl=en "https://support.google.com/googleplay/android-developer/answer/113469?hl=en")).

2\. \[Link\]([https://developers.google.com/android-publisher/getting_started](https://developers.google.com/android-publisher/getting_started "https://developers.google.com/android-publisher/getting_started")) your Google Play Developer Console to an API project.

3\. \[Set up API Access Clients using a service account\]([https://developers.google.com/android-publisher/getting_started](https://developers.google.com/android-publisher/getting_started "https://developers.google.com/android-publisher/getting_started")): Please note when you create your service account on the Google Developer Console, you have to choose \`json\` as **Key Type**.

4\. Grant the necessary rights to the service account with your \[Google Play Console\]([https://play.google.com/apps/publish](https://play.google.com/apps/publish "https://play.google.com/apps/publish")). Go to **Settings**  → **Users & permissions**  → **Invite new user**. Due to the way the Google Play Publisher API works, you have to grant at least the following permissions to the service account:

   * Access level: View app information.

   * Release management: Manage production releases, manage testing track releases.

   * Store presence: Edit store listing, pricing & distribution.

5\. As an optional step, you can add translations for your Store Listing. To allow the **Google Play Deploy** to assign your \`whatsnew\` files to the uploaded APK version, visit \[Translate & localize your\]([https://support.google.com/googleplay/android-developer/answer/3125566?hl=en](https://support.google.com/googleplay/android-developer/answer/3125566?hl=en "https://support.google.com/googleplay/android-developer/answer/3125566?hl=en")) and add translations for your Store Listing section.

Now let's head back to Bitrise and finish off the deploy configuration!

1\. In your Bitrise Dashboard, go to **Code Signing** and upload the service account JSON key into the **GENERIC FILE STORAGE**.

2\. Copy the env key which stores your uploaded file’s url.

   For example: \`BITRISEIO_SERVICE_ACCOUNT_JSON_KEY_URL\`

3\. Go back to the **Google Play Deploy** Step in your Workflow Editor.

4\. Fill out the required input fields as follows:

   * **Service Account JSON key file path**:  This field can accept a remote URL so you have to provide the environment variable which contains your uploaded service account JSON key. For example: \`$BITRISEIO_SERVICE_ACCOUNT_JSON_KEY_URL\`.

   * **Package name**: the package name of your Android app.

   * **Track**: the track where you want to deploy your APK (for example, alpha/beta/rollout/production or any custom track you set).

{% include message_box.html type="info" title="Other deploy steps you can add to your workflow" content="Click the **+** sign on the left side of your Workflow and select another deploy Step from our collection, for example, **Appetize.io deploy** or **Amazon Device Farm File Directory**, if you wish. "%}

That's all! Start or schedule a build and share the URL with external testers or distribute your app on an app store of your choice!