from Cluster_DBSCAN import Cluster_DBSCAN

def do_clustering_DBSCAN(top=top, traj=traj, kdist=None, 
                         epsilon=None, minpoints=None):
    """
    Clustering

    Parameters:
    ---------
    top : topology instance
    traj : traj instance
    kdist : Cluster_DBSCAN parameter
    epsilon : Cluster_DBSCAN parameter
    minpoints : Cluster_DBSCAN parameter

    Output:
    ------
    log file
    ...
    """
    cpptraj = CpptrajFile()
    dbcluster = Cluster_DBSCAN(kdist=kdist, epsilon=epsilon, minpoints=minpoints
                               sieveToCentroid=None)
    dbcluster.Help()
    dbcluster.Cluster()
    dbcluster.ClusterResults(cpptraj)
    print("Happy ending")
