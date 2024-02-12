/**
 * @file llfloaterscriptedprefs.cpp
 * @brief Color controls for the script editor
 * @author Cinder Roxley
 *
 * $LicenseInfo:firstyear=2006&license=viewerlgpl$
 * Second Life Viewer Source Code
 * Copyright (C) 2014, Linden Research, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation;
 * version 2.1 of the License only.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 * Linden Research, Inc., 945 Battery Street, San Francisco, CA  94111  USA
 * $/LicenseInfo$
 */

#include "llviewerprecompiledheaders.h"
#include "llfloaterscriptedprefs.h"

#include "llcolorswatch.h"
#include "llscripteditor.h"
#include "lldirpicker.h"
#include "llviewercontrol.h"
#include "llviewermenufile.h" // LLFilePickerReplyThread

#include "llfloaterreg.h"
#include "llpreviewscript.h"

LLFloaterScriptEdPrefs::LLFloaterScriptEdPrefs(const LLSD& key)
:	LLFloater(key)
,	mEditor(NULL)
{
	mCommitCallbackRegistrar.add("ScriptPref.applyUIColor",	boost::bind(&LLFloaterScriptEdPrefs::applyUIColor, this ,_1, _2));
	mCommitCallbackRegistrar.add("ScriptPref.getUIColor",	boost::bind(&LLFloaterScriptEdPrefs::getUIColor, this ,_1, _2));
	mCommitCallbackRegistrar.add("ScriptPref.SetPreprocInclude",	boost::bind(&LLFloaterScriptEdPrefs::setPreprocInclude, this));
	mCommitCallbackRegistrar.add("ScriptPref.SetExternalEditor", boost::bind(&LLFloaterScriptEdPrefs::setExternalEditor, this));
}

BOOL LLFloaterScriptEdPrefs::postBuild()
{
	mEditor = getChild<LLScriptEditor>("Script Preview");
	if (mEditor)
	{
		mEditor->initKeywords();
		mEditor->loadKeywords();
	}

	getChild<LLButton>("close_btn")->setClickedCallback(boost::bind(&LLFloaterScriptEdPrefs::closeFloater, this, false));
	return TRUE;
}

void LLFloaterScriptEdPrefs::applyUIColor(LLUICtrl* ctrl, const LLSD& param)
{
	LLUIColorTable::instance().setColor(param.asString(), LLColor4(ctrl->getValue()));
	mEditor->initKeywords();
	mEditor->loadKeywords();
}

void LLFloaterScriptEdPrefs::getUIColor(LLUICtrl* ctrl, const LLSD& param)
{
	LLColorSwatchCtrl* color_swatch = dynamic_cast<LLColorSwatchCtrl*>(ctrl);
	color_swatch->setOriginal(LLUIColorTable::instance().getColor(param.asString()));
}
void LLFloaterScriptEdPrefs::setPreprocInclude()
{
	std::string proposed_name(gSavedSettings.getString("AlchemyPreProcHDDIncludeLocation"));
	(new LLDirPickerThread(boost::bind(&LLFloaterScriptEdPrefs::changePreprocIncludePath, this, _1, _2), proposed_name))->getFile();
}

void LLFloaterScriptEdPrefs::changePreprocIncludePath(const std::vector<std::string>& filenames, const std::string& proposed_name)
{
	std::string dir_name = filenames[0];
	if (!dir_name.empty() && dir_name != proposed_name)
	{
		std::string new_top_folder(gDirUtilp->getBaseFileName(dir_name));
		gSavedSettings.setString("AlchemyPreProcHDDIncludeLocation", dir_name);
	}
}

void LLFloaterScriptEdPrefs::setExternalEditor()
{
	LLFilePickerReplyThread::startPicker(boost::bind(&LLFloaterScriptEdPrefs::changeExternalEditorPath, this, _1), LLFilePicker::FFLOAD_EXE, false);
}

void LLFloaterScriptEdPrefs::changeExternalEditorPath(const std::vector<std::string>& filenames)
{
	std::string exe_name = filenames[0];
	if (!exe_name.empty())
	{
		std::string command = "\"" + exe_name + "\" \"%s\"";
		gSavedSettings.setString("ExternalEditor", command);
	}
}
