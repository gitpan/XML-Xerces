/*
 * Copyright 2002,2004 The Apache Software Foundation.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef __PERLENTITYRESOLVERHANDLER
#define __PERLENTITYRESOLVERHANDLER

#include "PerlCallbackHandler.hpp"
#include "xercesc/sax/EntityResolver.hpp"
#include "xercesc/sax/InputSource.hpp"
#include "xercesc/util/XMLString.hpp"

XERCES_CPP_NAMESPACE_USE

class PerlEntityResolverHandler: public EntityResolver
			       , public PerlCallbackHandler
 {

protected:

public:

    PerlEntityResolverHandler();
    PerlEntityResolverHandler(SV *obj);
    ~PerlEntityResolverHandler();

    int type() {return PERLCALLBACKHANDLER_ENTITY_TYPE;}

	// The EntityResolver interface
    InputSource* resolveEntity (const XMLCh* const publicId, 
				const XMLCh* const systemId);

};

#endif /* __PERLENTITYRESOLVERHANDLER */
