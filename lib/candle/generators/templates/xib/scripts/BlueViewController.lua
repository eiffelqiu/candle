waxClass{"BlueViewController", UIViewController}

function init(self)
  self.super:initWithNibName_bundle("BlueViewController", nil)
  return self
end

function viewDidLoad(self)
  -- The button and textField varibles are automatically created and added to the class via IB
  self.button = self:view():viewWithTag(100)  
  self.button:addTarget_action_forControlEvents(self,"btnClicked:",UIControlEventTouchUpInside);  
end

-- Put IBAction next to, or above a function to make it appear in IB
function btnClicked(self, sender) -- IBAction
  local parentView = self:view():superview()
  UIView:beginAnimations_context(nil, nil)
  UIView:setAnimationTransition_forView_cache(UIViewAnimationTransitionFlipFromLeft, parentView, true)
  self:view():removeFromSuperview()
  orangeController = OrangeViewController:init()  
  parentView:addSubview(orangeController:view())
  UIView:commitAnimations()
end