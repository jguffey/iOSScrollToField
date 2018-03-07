# iOSScrollToField
Example app that shows how to scroll to the highlighted field.

This app was inspired by fustration I felt trying to figure out how to scroll the view to the currently active field.

## The Problem.
In some cases, there may be a form field that's longer than the screen size minus the height of the displayed keyboard. In that case, fields may appear off the view, or not in the center of the view. 

## The Solution.
The solution is to embed the entire view within a UIScrollView, and make the ViewController implement the UITextFieldDelegate. Now, the ViewController can respond when text fields become active! Use this hook to save the position of the next-active text field. 

Additionally, hook into the NSNotification.Name.UIKeyboardWillShow event, and when it's called, calculate the nessessary scroll position of the scroll view, and scroll to it. For extra awesome, make it an animation.

## Why this works.
The view must be able to extend taller than the view controller, that's why I've added the orange block on the bottom as well as the top. This will give the view a natural space to scroll if it must scroll the view up to center the active text field.

The scroll view doesn't seem to care about child textfields becoming active, so we must make it care. We use the UITextFieldDelegate method to find the position of the textField when it becomes active. We use the KeyboardWillApepar event to make sure we know what size the keyboard will be (different devices have different keyboard sizes!) and we use that to calculate a new position for the scroll view to use. Finally, we just animate the scroll view to the field. This should probably be easier.
