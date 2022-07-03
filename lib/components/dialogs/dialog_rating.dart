import 'dart:math';
import 'package:flutter/material.dart';

//ref. CodeX https://www.youtube.com/watch?v=mK9N0obmiZQ
class DialogRating extends StatefulWidget {
  const DialogRating({Key? key}) : super(key: key);

  @override
  _DialogRatingState createState() => _DialogRatingState();
}

class _DialogRatingState extends State<DialogRating> {
  var _pageController = PageController();
  var _starPosition = 200.0;
  var _rating = 0;
  var _selectedChipIndex = -1;
  var _isMoreDetailActive = false;
  var _moreDetailFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          //txt msg
          Container(
            height: max(300, MediaQuery.of(context).size.height * 0.3),
            child: PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                _buildNote(),
                _buildCauseRating(),
              ],
            ),
          ),
          //done button
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.lightBlue,
                child: MaterialButton(
                  child: Text('Done'),
                  textColor: Colors.white,
                  onPressed: _hideDialog,
                ),
              )),
          //skip button
          Positioned(
              right: 0,
              child: MaterialButton(
                child: Text('Skip'),
                onPressed: _hideDialog,
              )),
          //star rating
          AnimatedPositioned(
            top: _starPosition,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => IconButton(
                  onPressed: () {
                    _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                    setState(() {
                      _starPosition = 20.0;
                      _rating = index + 1;
                    });
                  },
                  icon: index < _rating
                      ? const Icon(
                          Icons.star,
                          size: 32,
                        )
                      : const Icon(
                          Icons.star_border,
                          size: 32,
                        ),
                  color: Colors.amber,
                ),
              ),
            ),
            duration: Duration(milliseconds: 300),
          ),
          //back button
          if (_isMoreDetailActive)
            Positioned(
              left: 0,
              top: 0,
              child: MaterialButton(
                onPressed: () {
                  setState(() {
                    _isMoreDetailActive = false;
                  });
                },
                child: Icon(Icons.arrow_back_ios),
              ),
            ),
        ],
      ),
    );
  }

  _buildNote() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: const [
        Text(
          "Thanks for rading",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            color: Colors.amber,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text("we love to get your feedback"),
        Text('How was your ride today?'),
      ],
    );
  }

  _buildCauseRating() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Visibility(
          visible: !_isMoreDetailActive,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('What could be better?'),
              //cause selection
              Wrap(
                spacing: 8.0,
                alignment: WrapAlignment.center,
                children: List.generate(
                  6,
                  (index) => InkWell(
                    onTap: () {
                      setState(() {
                        _selectedChipIndex = index;
                      });
                    },
                    child: Chip(
                      backgroundColor: _selectedChipIndex == index
                          ? Colors.amber
                          : Colors.grey[300],
                      label: Text('Text ${index + 1}'),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              InkWell(
                onTap: () {
                  _moreDetailFocusNode.requestFocus();
                  setState(() {
                    _isMoreDetailActive = true;
                  });
                },
                child: Text(
                  'Want to tell us more?',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          replacement: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Tell us more'),
              Chip(
                label: Text('Text ${_selectedChipIndex + 1}'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  focusNode: _moreDetailFocusNode,
                  decoration: InputDecoration(
                    hintText: 'Write your review here...',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _hideDialog() {
    if (Navigator.canPop(context)) Navigator.pop(context);
  }
}
