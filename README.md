Taggable Image component for Adobe Experience Manager
===============================

This project implements an AEM page component that extends the existing Image component and adds a "tagging" feature that mimics Facebook's or Flickr's one.

When a user requests the creation of a tag, a square box that can be moved and resized is overlaid on the image. The creation of the tag is completed when the users enters a name for the tag. The name can be arbitrary or can be the name of an AEM user, selected from a drop-down list with auto-completion. In case an existing user is selected, the tag's properties contain the path of the resource corresponding to the user and the tag is rendered as a link to the user's public profile page in the Geometrixx Outdoors site.

Existing tags will appear when the user hovers on the tag's bounding box and can be deleted by clicking on the "X" icon in the box's corner.

Tags are stored inside a folder called "tags" that is a child of the component's instance node. In order to create tags, users must have permission to create nodes under the component's node itself.

The client-side tagging code is based on a modified version of Karl Mendes' jQuery Photo Tag Plugin at http://karlmendes.com/2010/07/jquery-photo-tag-plugin/

Source code for the project can be found at https://github.com/Netcentric/aem-taggable-image