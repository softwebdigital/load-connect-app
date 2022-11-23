
const baseUrl = "https://app.loadconnect.ng/api/";

const loginEndpoint = "${baseUrl}auth/login";
const registerEndpoint = "${baseUrl}auth/register";
const generateTokenEndpoint = "${baseUrl}auth/generate_token";
const verifyTokenEndpoint = "${baseUrl}auth/verify-email";

const verifyForgetPasswordEndpoint = "${baseUrl}auth/verify-code";
const forgotPasswordEndpoint = "${baseUrl}auth/forgot-password";
const resetPasswordEndpoint = "${baseUrl}auth/reset-password";
const resendRegistrationEmailEndpoint = "${baseUrl}auth/resend-email";

const completeProfileEndpoint = "${baseUrl}complete_reg";

const userEndpoint = "${baseUrl}user/me";
const activateAccountEndpoint = "${baseUrl}user/activate";
const deActivateAccountEndpoint = "${baseUrl}user/deactivate";
const changePasswordEndpoint = "${baseUrl}user/update-password";
const updateProfileEndpoint = "${baseUrl}user/update-profile";
const updateProfilePictureEndpoint = "${baseUrl}user/update-photo";
const userNotificationSettingsEndpoint = "${baseUrl}user/notification-settings";
const blockedUsersEndpoint = "${baseUrl}user/blocked-users";
const uploadKYCEndpoint = "${baseUrl}user/kyc-verification";
String blockUserEndpoint(String uid) => "${baseUrl}user/block/$uid";
String unBlockUserEndpoint(String uid) => "${baseUrl}user/unblock/$uid";

const createLoadEndpoint = "${baseUrl}loads";
const getSenderLoadEndpoint = "${baseUrl}loads";

/// Utilities Endpoint
const getVehicleTypesEndpoint = "${baseUrl}utils/vehicle_types";
String getClosestVehicleEndpoint(String lat, String lng) => "${baseUrl}utils/available_trucks?latitude=3.456757&longitude=44.67458";


///
const getTruckEndpoint = "${baseUrl}trucks";
String saveTruckEndpoint(String id) => "${baseUrl}trucks/save/$id";