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
#define OPEN_SOURCE_TEXT @"Open Source Library"
#define PRIVACY_POLICY_TEXT @"Privacy Policy"
#define VERSION_TEXT @"Version"
#define POWERED_BY_TEXT @"Powered by"
#define ENTER_YOUR_FEEDBACK_TEXT @"Enter your feedback here:"
#define GO_QUIZZY_LAB @"GoQuizzy Lab."
#define FEEDBACK_TEXT @"Thank you for using GoQuizzly. We really appreciate you choosing our App for your quizzes.\n\nTo help us to improve, we'd like to ask you to provide some feedback which helps us impliment new features or fix bugs you faced."

#define COPYRIGHT @"Copyright (c) 2014-2016 Flipboard Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the \"Software\"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: \n\nThe above copyright notice and this permission notice shall be included in all \ncopies or substantial portions of the Software. \n\nTHE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE."
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
#define FLA_LINK @"https://github.com/Flipboard/FLAnimatedImage"
#endif /* Strings_h */
