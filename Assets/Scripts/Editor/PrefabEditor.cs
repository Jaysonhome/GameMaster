using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

public class PrefabEditor : Editor
{
    private static void ProcessPrefabs(Action<GameObject> doProcess)
    {
        List<GameObject> prefabs = new List<GameObject>();
        var resourcesPath = Application.dataPath;
        var absolutePaths = System.IO.Directory.GetFiles(resourcesPath, "*.prefab", System.IO.SearchOption.AllDirectories);
        for (int i = 0; i < absolutePaths.Length; i++)
        {
            EditorUtility.DisplayProgressBar("获取预制体……", "获取预制体中……", (float)i / absolutePaths.Length);

            string path = "Assets" + absolutePaths[i].Remove(0, resourcesPath.Length);
            path = path.Replace("\\", "/");
            GameObject prefab = AssetDatabase.LoadAssetAtPath(path, typeof(GameObject)) as GameObject;
            if (prefab != null)
            {
                prefabs.Add(prefab);
                doProcess(prefab);
            }
            else
                Debug.Log("预制体不存在！ " + path);
        }
        EditorUtility.ClearProgressBar();
    }
    [MenuItem("Tools/遍历文件夹预制体并处理")]
    static void ProcessPrefabs()
    {
        bool isDirty = false;
        ProcessPrefabs((prefab) =>
        {
            prefab.AddComponent<Animation>();
            EditorUtility.SetDirty(prefab);
            isDirty = true;
        });
        if (isDirty)
            AssetDatabase.SaveAssets();
        EditorUtility.DisplayDialog("tips", "完成了", "确定");
    } 
}
