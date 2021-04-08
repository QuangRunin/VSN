import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:vsn/common/styles.dart';
import 'package:vsn/common/utils.dart';
import 'package:vsn/custom_widgets/cachedImage.dart';
import 'package:vsn/model/m_post.dart';
import 'package:vsn/pages/theme/theme_controller.dart';
// ignore: must_be_immutable
class NewsFeedItem extends StatelessWidget {
  ThemeController themeController;
  MPost mPost;
  NewsFeedItem({this.themeController,this.mPost});
  @override
  Widget build(BuildContext context) {
    print('>>> ${mPost.avatarUrl}');
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0,left: 16.0,right: 16.0),
            child: Row(
              children: [
                SizedBox(
                  width: 40.0,
                  height: 40.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: CachedImage(image: mPost.avatarUrl != null ? mPost.avatarUrl  : noImage)
                  ),
                ),
                SizedBox(width: 10.0),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mPost.name,
                      style: Utils.getFont(theme: themeController,fontSize: 14.0,fontWeight: FontWeight.w700,),
                    ),
                    SizedBox(height: 3.0),
                    Text(
                      mPost.dateTime,
                      style: Utils.getFont(theme: themeController,fontSize: 11.0,fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
          mPost.status != null ? Padding(
            padding: const EdgeInsets.only(top: 16.0,left: 16.0,right: 16.0),
            child: Text(
              mPost.status,
              style: Utils.getFont(theme: themeController,fontSize: 14.0,fontWeight: FontWeight.w500,height: 1.5),
            ),
          ) : SizedBox(),
          mPost.image != null ? Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: SizedBox(
              height: 300.0,
              child: CachedImage(
                image: mPost.image,
              ),
            ),
          ) : SizedBox(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "${mPost.totalLike} likes",
                  style: Utils.getFont(theme: themeController,fontSize: 12.0,fontWeight: FontWeight.w700,),
                ),
                SizedBox(height: 14.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    LikeButton(
                      size: 24.0,
                      circleColor:
                      CircleColor(start: Colors.red, end: Colors.blue),
                      bubblesColor: BubblesColor(
                        dotPrimaryColor: Colors.red,
                        dotSecondaryColor: Colors.red,
                      ),
                      isLiked: true,
                      onTap: onLikeButtonTapped,
                      likeBuilder: (bool isLiked) {
                        return Image.asset(isLiked ? 'assets/icons/heart_active.png' : 'assets/icons/heart.png',width: 24.0,height: 24.0) ;
                      },
                    ),
                    SizedBox(width: 16.0),
                    InkWell(
                      child: Image.asset('assets/icons/comment.png',width: 22.0,height: 22.0),
                      onTap: (){

                      },
                    ),
                    SizedBox(width: 16.0),
                    InkWell(
                      child: Image.asset('assets/icons/share.png',width: 24.0,height: 24.0),
                      onTap: (){

                      },
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0,right: 16.0),
            child: Text(
              "Xem thêm 24 bình luận..."
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                SizedBox(
                  width: 40.0,
                  height: 40.0,
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      child: CachedImage(image: noImage)
                  ),
                ),
                SizedBox(width: 10.0,),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),color: Color(0xFFf2f3f5),
                    ),
                    child: TextField(
                      onTap: (){

                      },
                      onChanged: (value){

                      },
                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      minLines: 1,
                      autofocus: true,
                      autocorrect: false,
                      focusNode: null,
                      textInputAction: TextInputAction.newline,
                      keyboardType: TextInputType.multiline,
                      readOnly: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.grey,
                        focusColor: Colors.grey,
                        hintText: 'Viết bình luận...',
                        hintStyle: TextStyle(
                          fontSize: 13.0,
                          color: themeController.appBarTextColor,
                        ),
                        isCollapsed: true,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.all(10.0),
                        suffixIconConstraints: BoxConstraints(minWidth: 40, maxHeight:40),
                        suffixIcon: InkWell(
                            onTap: (){

                            },
                            child: Icon(Icons.camera,color: themeController.appBarColor)
                        )
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
Future<bool> onLikeButtonTapped(bool isLiked) async{
  return !isLiked;
}
