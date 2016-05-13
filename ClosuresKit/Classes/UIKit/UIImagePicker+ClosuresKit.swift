//
//  UIImagePicker+ClosuresKit.swift
//  Pods
//
//  Created by HuangCharlie on 5/10/16.
//
//

import Foundation

public typealias CKImagePickerPickHandler = (picker:UIImagePickerController,info:Dictionary<String,AnyObject>)->()
public typealias CKImagePickerCancelHandler = (picker:UIImagePickerController)->()

private class ClosureWrapper:NSObject, NSCopying {
    
    var pickClosure:CKImagePickerPickHandler?
    
    var cancelClosure:CKImagePickerCancelHandler?
    
    convenience init(pickClosure: CKImagePickerPickHandler?, cancelClosure:CKImagePickerCancelHandler?) {
        
        self.init()
        self.pickClosure = pickClosure
        self.cancelClosure = cancelClosure
    }
    
    @objc func copyWithZone(zone: NSZone) -> AnyObject {
        
        var wrapper: ClosureWrapper = ClosureWrapper()
        wrapper.pickClosure = pickClosure
        wrapper.cancelClosure = cancelClosure
        return wrapper
    }
}

private class ImagePickerDelegateExecutor:NSObject,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    //Mark: - Image Picker Delegate
    public func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        //
    }
    
    public func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        picker.ck_didFinishPickingMediaClosure!(picker:picker, info:info)
    }
    
    public func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.ck_didCancelClosure!(picker: picker)
    }
}


public extension UIImagePickerController {
    
    public static func ck_imagePickerController()->UIImagePickerController {
        var picker = UIImagePickerController()
        
        let executor = ImagePickerDelegateExecutor()
        picker.ck_delegateExecutor = executor
        picker.delegate = executor
        
        return picker
    }
    
    private var ck_delegateExecutor:ImagePickerDelegateExecutor? {
        get {
            if let executor = ck_associatedValueForKey(&AssociatedKeys.CKImagePickerExecutorKey) as? ImagePickerDelegateExecutor {
                return executor
            }
            return nil
        }
        set{
            ck_associateValue(newValue!, key: &AssociatedKeys.CKImagePickerExecutorKey)
        }

    }
    
    private struct AssociatedKeys {
        static var CKImagePickerExecutorKey = "CKImagePickerExecutorKey"
        static var CKImagePickerActionKey = "CKImagePickerActionKey"
        static var CKImagePickerCancelKey = "CKImagePickerCancelKey"
    }
    
    /**
     *	The block that fires after the user pick an image
     */
    private var ck_didFinishPickingMediaClosure:CKImagePickerPickHandler? {
        get {
            if let wrapper = ck_associatedValueForKey(&AssociatedKeys.CKImagePickerActionKey) as? ClosureWrapper{
                return wrapper.pickClosure
            }
            return nil
        }
        set{
            ck_associateValue(ClosureWrapper(pickClosure: newValue,cancelClosure: nil), key: &AssociatedKeys.CKImagePickerActionKey)
        }
    }
    
    public func ck_setDidFinishPickingMediaClosure(closure:CKImagePickerPickHandler?) -> UIImagePickerController {
        self.ck_didFinishPickingMediaClosure = closure
        return self
    }

    /**
     *	The block that fires after the user cancels out of picker
     */
    private var ck_didCancelClosure:CKImagePickerCancelHandler? {
        get {
            if let wrapper = ck_associatedValueForKey(&AssociatedKeys.CKImagePickerActionKey) as? ClosureWrapper{
                return wrapper.cancelClosure
            }
            return nil
        }
        set{
            ck_associateValue(ClosureWrapper(pickClosure: nil,cancelClosure: newValue), key: &AssociatedKeys.CKImagePickerCancelKey)
        }
    }
    
    public func ck_setDidCancelClosure(closure:CKImagePickerCancelHandler?) -> UIImagePickerController {
        self.ck_didCancelClosure = closure
        return self
    }
}