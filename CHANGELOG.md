## 0.3.7
* update dependency version
* account_api#code add multisig_request, authorization, payment object.

## 0.3.6
* add outputApi.
* add collectibleApi.requests
* code api support non_fungible_request

## 0.3.5
* add pin logs api
* fix delete address api
* fix sign token

## 0.3.4
* add feeAssetId to `Address` and `Asset` response.

## 0.3.3
* add `codeId` and `codeUrl` field to `User` type.

## 0.3.2
* fix invalid account api pin request path.
* add `deactiveVerification` and `deactive` account api.

## 0.3.1

* add `state` field to `Snapshot` class.

## 0.3.0

## 0.2.16

## 0.2.15

* Add `ConversationApi.disappear`.

## 0.2.14

Add `VerificationResponse.deactivatedAt`.

## 0.2.13

Add login with phone number api.

## 0.2.12
Add `StickerAlbum.isVerified`

## 0.2.11
Fix `MessageApi.messageStatusOffset`
Add `BlazeMessageData`
Add `MessageStatus`

## 0.2.10
Fix `StickerRequest` 

## 0.2.9
Add user favorite app api.

## 0.2.8
Update dependencies

## 0.2.7
Add `AccountApi.getStickerAlbum`

## 0.2.6
Add `AccountApi.addSticker`.

## 0.2.5
Fix parse json.

## 0.2.4
Add `StickerAlbum.banner`.

## 0.2.2
Add `AccountApi.code` and `ConversationApi.join` API.

`ConversationApi.exit` return type change to void. 

remove `EnumToString`, change to use top level function: `enumConvertToString`, `fromStringToEnum`

## 0.2.1
Fix location message

## 0.2.0
Fix some api cause NPE.
1. `getProvisioningId` return `ProvisioningId` instead of `Provisioning`.
2. class `Provisioning` field: `platform` `provisioningCode` `sessionId` `userId` to nullable.
3. class `CircleConversation` field: `pinTime` to nullable.

## 0.1.1
Add search user API

## 0.1.0
More sticker API

## 0.0.8
More message type

## 0.0.7
Delete the default setting Accept-Language en_us, and update dependencies.

## 0.0.6
Support oauth token

## 0.0.5
Support oauth token

## 0.0.4
Fix oauth API

## 0.0.3
Export more vo class

## 0.0.2
Add API error codes

## 0.0.1
Initial version
