/*
(C) Copyright 2015 Netcentric AG.

All rights reserved. This program and the accompanying materials
are made available under the terms of the Eclipse Public License v1.0
which accompanies this distribution, and is available at
http://www.eclipse.org/legal/epl-v10.html
*/
function makeTaggable(path) {
    $('div.image img.taggable').photoTag({
        requestTagsUrl: path + '/tags.children.json',
        addTagUrl: path + '/tags/',
        parametersForNewTag: {
            name: {
                parameterKey: 'text',
                isAutocomplete: true,
                autocompleteUrl: path + '.users',
                label: 'Name'
            }
        }
    });
}
