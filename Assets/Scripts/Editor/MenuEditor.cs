using System;
using System.Collections;
using System.Collections.Generic;
using System.Reflection;
using UnityEditor;
using UnityEngine;

public class MenuEditor : Editor
{ 

    [MenuItem("Custom/Run _F1")]
    static void PlayToggle()
    {
        EditorApplication.isPlaying = !EditorApplication.isPlaying;
    }

    static MethodInfo clearMethod = null;
    [MenuItem("Custom/Clear Console %#z")] //%:ctrl #
    private static void ClearConsole()
    {
        if (clearMethod == null)
        {
            Type log = typeof(EditorWindow).Assembly.GetType("UnityEditor.LogEntries");
            clearMethod = log.GetMethod("Clear");
        }
        clearMethod.Invoke(null, null);
    }
}
