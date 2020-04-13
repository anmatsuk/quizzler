//
//  Strings.h
//  Quizzler
//
//  Created by Anastasia Matsuk on 4/9/20.
//  Copyright © 2020 Anastasia Matsuk. All rights reserved.
//

#ifndef Strings_h
#define Strings_h

/*
 messages
 */
#define ERROR @"Error"
#define ERROR_CODE_NOT_EXISTS @"There is no questions for provided invitation code!"
#define ERROR_CODE_EMPTY @"Quizz code is empty"

#define ERROR_CONNECTION @"Something went wrong. Please try again ..."

#define FINISH_MESSAGE @"Congratulations! \n You've successfully finished your quiz."
/*
 urls definitions
 */
#define ENDPOINT @"https://api.goquizzy.app:8080"
#define QUESTIONPATH @"/questions?invitationCode="
#define DEVICEID_URL @"https://api.goquizzy.app:8080/generateDeviceId"
#define POLICY_LINK @"https://api.goquizzy.app/PrivacyPolicy.html"
#endif /* Strings_h */
