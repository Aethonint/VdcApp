library user_data;

/// Stores the logged-in user's ID
int? loggedInUserId;

/// Stores the logged-in user's first name
String? loggedInUserName;

/// Stores the logged-in user's email
String? loggedInUserEmail;

/// Stores the logged-in user's token (used for logout)
String? loggedInUserToken;

/// Clears all logged-in user data (useful on logout)
void clearUserData() {
  loggedInUserId = null;
  loggedInUserName = null;
  loggedInUserEmail = null;
  loggedInUserToken = null;
}
