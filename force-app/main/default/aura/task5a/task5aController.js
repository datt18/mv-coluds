// // <!-- image-component.js -->
// ({
//     init: function(component, event, helper) {
//       // Set the initial values for the component
//       component.set('v.style', `background-color: ${component.get('v.backgroundColor')}; font-size: ${component.get('v.fontSize')}; color: ${component.get('v.fontColor')};`);
//     },
//     updateImageUrl: function(component, event, helper) {
//       // Update the image URL when the user changes the input value
//       const imageUrl = event.getParam('value');
//       component.set('v.imageUrl', imageUrl);
//     },
//     updateDescription: function(component, event, helper) {
//       // Update the description when the user changes the input value
//       const description = event.getParam('value');
//       component.set('v.description', description);
//     },
//     updateBackgroundColor: function(component, event, helper) {
//       // Update the background color when the user changes the input value
//       const backgroundColor = event.getParam('value');
//       component.set('v.backgroundColor', backgroundColor);
//       component.set('v.style', `${component.get('v.style')} background-color: ${backgroundColor};`);
//     },
//     updateFontSize: function(component, event, helper) {
//       // Update the font size when the user changes the input value
//       const fontSize = event.getParam('value');
//       component.set('v.fontSize', fontSize);
//       component.set('v.style', `${component.get('v.style')} font-size: ${fontSize};`);
//     },
//   updateFontColor: function(component, event, helper) {
//     // Update the font color when the user changes the input value
//     const fontColor = event.getParam('value');
//     component.set('v.fontColor', fontColor);
//     component.set('v.style', `${component.get('v.style')} color: ${fontColor};`);
//   }
// })
// Component's .js file
// ({
//     init: function(component, event, helper) {
//     imageUrl: '';
//     bgColor: '';
//     description: '';
//     fontSize: '';
//     fontColor: '';
//     },
  
//     handleImageUrlChange: function(component, event, helper) {
//       this.imageUrl = event.target.value;
//     },
//     handleBgColorChange: function(component, event, helper) {
//       this.bgColor = event.target.value;
//     },
//     handleDescriptionChange: function(component, event, helper) {
//       this.description = event.target.value;
//     },
//     handleFontSizeChange: function(component, event, helper) {
//       this.fontSize = event.target.value;
//     },
//     handleFontColorChange: function(component, event, helper) {
//       this.fontColor = event.target.value;
//     }
//   });
  

({
    handleImageUrlChange: function(cmp, event) {
      // Get the new value of the input field
      var newValue = event.getParam("value");
      // Set the new value of the "imageUrl" attribute
      cmp.set("v.imageUrl", newValue);
    },
    handleBgColorChange: function(cmp, event) {
      // Get the new value of the input field
      var newValue = event.getParam("value");
      // Set the new value of the "bgColor" attribute
      cmp.set("v.bgColor", newValue);
    },
    handleDescriptionChange: function(cmp, event) {
      // Get the new value of the input field
      var newValue = event.getParam("value");
      // Set the new value of the "description" attribute
      cmp.set("v.description", newValue);
    },
    handleFontSizeChange: function(cmp, event) {
      // Get the new value of the input field
      var newValue = event.getParam("value");
      // Set the new value of the "fontSize" attribute
      cmp.set("v.fontSize", newValue);
    },
    handleFontColorChange: function(cmp, event) {
      // Get the new value of the input field
      var newValue = event.getParam("value");
      // Set the new value of the "fontColor" attribute
      cmp.set("v.fontColor", newValue);
    }
  })
  