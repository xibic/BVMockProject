//
//  Constants.h
//
//  Created by xibic on 9/28/15.
//

#import <Foundation/Foundation.h>




//Macros
#define SCREEN_SIZE [[UIScreen mainScreen] bounds].size
#define SINGLE_DATA_CELL_HEIGHT 50
#define MULTIPLE_DATA_CELL_HEIGHT 60

@interface Constants : NSObject




//| ----------------------------------------------------------------------------
/*------------APP CONSTANTS------------*/
struct ConstantsStruct{
    __unsafe_unretained NSString *Title;
};
FOUNDATION_EXPORT const struct ConstantsStruct AppConstants;





//| ----------------------------------------------------------------------------
/*------------FONTS------------*/
struct FontsStruct{
    __unsafe_unretained NSString *Regular;
    __unsafe_unretained NSString *Light;
    __unsafe_unretained NSString *Bold;
    __unsafe_unretained NSString *Medium;
    __unsafe_unretained NSString *Thin;
    float HeaderFontSize;
    float TitleFontSize;
    float ContentFontSize;
};
FOUNDATION_EXPORT const struct FontsStruct Fonts;





//| ----------------------------------------------------------------------------
/*------------APP COLOR------------*/
struct AppColorStruct{
    __unsafe_unretained NSString *tabBarColor;
    __unsafe_unretained NSString *navBarColor;
    __unsafe_unretained NSString *fontColor;
    __unsafe_unretained NSString *textTitleColor;
    __unsafe_unretained NSString *textContentColor;
    __unsafe_unretained NSString *backgroundColor;    
};
FOUNDATION_EXPORT const struct AppColorStruct AppColor;




//| ----------------------------------------------------------------------------
/*------------LIST CATEGORY------------*/
enum ListCategory{
    kDepartmentList = 0,
    kGroupList,
    kProductList,
    kShoppingCartList
};




/*------------START------------*/

/*------------END------------*/

@end
