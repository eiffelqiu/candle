waxClass{"OrangeViewController", UIViewController}

IBOutlet "textField" -- This makes the property visible from IB

function init(self)
  self.super:initWithNibName_bundle("OrangeViewController", nil)
  return self
end

function viewDidLoad(self)
  -- The button and textField varibles are automatically created and added to the class via IB
  self.button = self:view():viewWithTag(100)    
  self.button:addTarget_action_forControlEvents(self,"btnClicked:",UIControlEventTouchUpInside);   
end

function btnClicked(self, sender)
  local parentView = self:view():superview()
  UIView:beginAnimations_context(nil, nil)
  UIView:setAnimationTransition_forView_cache(UIViewAnimationTransitionFlipFromRight, parentView, true)
  self:view():removeFromSuperview()
  blueController = BlueViewController:init()    
  parentView:addSubview(blueController:view())
  UIView:commitAnimations()
end