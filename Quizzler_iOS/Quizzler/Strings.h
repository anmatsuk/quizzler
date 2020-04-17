//
//  Strings.h
//  Quizzler
//
//  Created by Anastasia Matsuk on 4/9/20.
//  Copyright © 2020 Anastasia Matsuk. All rights reserved.
//

#ifndef Strings_h
#define Strings_h

//Button
#define GO_QUIZZ_BUTTON_TITLE @"Start"
#define SEND_TEXT @"Send"

//String
#define SEND_FEEDBACK_TEXT @"Send Feedback"
#define OPEN_SOURCE_TEXT @"Open Source attributions"
#define PRIVACY_POLICY_TEXT @"Privacy Policy"
#define VERSION_TEXT @"Version"
#define POWERED_BY_TEXT @"Powered by"
#define GO_QUIZZY_LAB @"GOQuizzy Lab."

/*
 messages
 */
#define ERROR @"Error"
#define ERROR_CODE_NOT_EXISTS @"There is no questions for provided invitation code!"
#define ERROR_CODE_EMPTY @"Quizz code is empty"
#define ERROR_CONNECTION @"Something went wrong. Please try again ..."
#define FINISH_MESSAGE @"Congratulations! \n You've successfully finished your quiz."
#define EMPTY_FEEDBACK @"Feedback is empty"

/*
 urls definitions
 */
#define ENDPOINT @"https://api.goquizzy.app:8080"
#define QUESTIONPATH @"/questions?invitationCode="
#define DEVICEID_URL @"https://api.goquizzy.app:8080/generateDeviceId"
#define POLICY_LINK @"https://api.goquizzy.app/PrivacyPolicy.html"
#define CAT_GIF @"cat_cropped"
#endif /* Strings_h */
